//d2dmp masterserver v0.61
//by PrimuS, 2012
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string>
#include <fstream>
#include <math.h>
#include "39dll.h"
#include "server_entry.h"
#define _USE_MATH_DEFINES
using namespace std;

//stuffs
//server array
server_entry sv_list[32];
int sv_port = 25667;
bool sv_verbose = false;


/* ENTRY CLASS FUNCTIONS */
void server_entry::update(int a, std::string b, double p, std::string c, std::string d, std::string e, std::string f, bool g)
{
    id = a;
    ip = b;
    name = c;
    map = d;
    plr = e;
    ver = f;
    active = g;
    prt = p;

    if (active)
    {
        if (sv_verbose)
        {
            cout << ":: LIST: Entry " << id << " updated: " << endl;
            cout << "IP: " << ip << ":" << prt << " NAME: " << name << " MAP: " << map << " PLR: " << plr << " VER: " << ver << endl;
        }
        life = 0;
    }
    else
    {
        if (sv_verbose) {cout << ":: LIST: Entry " << id << " cleared." << endl;}
    }
}

void server_entry::step()
{
    if (active)
    {
        //cout << life << endl;
        life++;
        if (life > 10000)
        {
            if (sv_verbose) {cout << ":: LIST: Entry " << id << " timed out." << endl;}
            active = false;
            life = 0;
        }
    }
}
/* */

/*  MASTERSERVER FUNCTIONS  */
void list_send(double sock)
{
    //socket must be opened already
    int z = 0;
    int c = 0;
    for (z = 1; z < 32; z++)
    {
        if (sv_list[z].active)
        {
            c++;
        }
    }
    clearbuffer(0);
    writebyte(254, 0);
    writebyte(c, 0);
    for (z = 1; z < 32; z++)
    {
        if (sv_list[z].active)
        {
            const char* icstr = sv_list[z].ip.c_str();
            char* istr = const_cast<char*>(icstr);
            writestring(istr, 0);
            const char* ncstr = sv_list[z].name.c_str();
            char* nstr = const_cast<char*>(ncstr);
            writestring(nstr, 0);
            const char* mcstr = sv_list[z].map.c_str();
            char* mstr = const_cast<char*>(mcstr);
            writestring(mstr, 0);
            const char* pcstr = sv_list[z].plr.c_str();
            char* pstr = const_cast<char*>(pcstr);
            writestring(pstr, 0);
            const char* vcstr = sv_list[z].ver.c_str();
            char* vstr = const_cast<char*>(vcstr);
            writestring(vstr, 0);
            writedouble(sv_list[z].prt, 0);
        }
    }
    sendmessage(sock, 0, 0, 0);
}

int list_find_slot()
{
	//returns a free slot
	//if no free slots, returns 0
	int z = 0;

	for (z = 1; z < 32; z++)
	{
		if (!sv_list[z].active)
		{
			break;
		}
	}
	return z;
}

int list_find_ip(std::string ip, double prt)
{
    //finds an entry with the specified ip
	int z;

	for (z = 1; z < 32; z++)
	{
        //debug: cout << sv_list[z].ip << endl;
		if (sv_list[z].ip == ip && sv_list[z].prt == prt && sv_list[z].active)
		{
			return z;
			break;
		}
	}
	return 0;
}

void list_work(double sock)
{
    //deals with clients
    setsync(sock, 0);
	receivemessage(sock, 0, 0);

	int mode, j; //0 - get list, 1 - update list, 2 - delete from list, 3 - get external IP
	std::string i, n, m, p, v;
	double s;

	mode = readbyte(0);
	n = readstring(0);
	m = readstring(0);
	p = readstring(0);
	v = readstring(0);
	s = readdouble(0);
	i = tcpip(sock);

	if (sv_verbose) {cout << ":: LIST: Request from " << i << ", mode " << mode << endl;}
    j = list_find_ip(i, s);

	switch (mode)
	{
	    case 0:
            list_send(sock);
        break;
        case 1:
            if (j == 0) {j = list_find_slot();}
            sv_list[j].update(j, i, s, n, m, p, v, true);
        break;
        case 2:
            if (j > 0) {sv_list[j].update(j, "null", 0, "null", "null", "null", "null", false);}
        break;
        case 3:
            clearbuffer(0);
            writebyte(253, 0);
            const char* ipcstr = i.c_str();
            char* ipstr = const_cast<char*>(ipcstr);
            writestring(ipstr, 0);
            sendmessage(sock, 0, 0, 0);
        break;
	}
}
/*                       */

int main(int argc, char *argv[])
{
	bool sys_running = true;

	//check for arguments
	if (argc > 1)
	{
        std::string arg = "";
        for (int a = 0; a < argc; a++)
        {
            arg = argv[a];
            if (arg == "-v")
            {
                sv_verbose = true;
            }
            if (arg == "-p" && a + 1 < argc)
            {
                arg = argv[a + 1];
                sv_port = atoi(arg.c_str());
            }
        }
	}

	cout << ":: SYSTEM: D2DMP06_SLIST v0.1 starting up" << endl;

    for (int i = 0; i < 32; i++)
	{
        sv_list[i].active = false;
    }

    cout << ":: NET: Trying to init network" << endl;
    dllInit();
    cout << ":: NET: Done" << endl;

    cout << ":: NET: Trying to open a TCP socket on " << sv_port << "..." << endl;
    double sv_tcp = tcplisten(sv_port, 16, 1);

	if (sv_tcp <= 0)
	{
		cout << ":: NET: FATAL ERROR: Failed to open a TCP socket on " << sv_port << endl;
		dllFree();
		return 0;
	}

	cout << ":: NET: Opened a TCP socket on " << sv_port << endl;

	cout << ":: SYSTEM: Startup finished." << endl;

	while (sys_running)
	{
	    Sleep(5); //trying to simulate game maker's tickrate

        //incoming message processing
	    double cl_sock = tcpaccept(sv_tcp, 1);
	    if (cl_sock > 0)
        {
			list_work(cl_sock);
        }

        //entry keepalive
        for (int x = 1; x < 32; x++)
		{
            if (sv_list[x].active)
            {
                sv_list[x].step();
            }
        }

		//gtfo
	}

	cout << ":: NET: Shutting down." << endl;
	cout << ":: SYSTEM: Shutting down." << endl;

	//stops the server
    closesock(sv_tcp);
	dllFree();
    return 0;
}

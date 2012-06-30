//describes the serverlist entry class
class server_entry
{
    public:
		//info
        std::string name, map, plr, ver, ip;
        double prt;
        bool active;
        int life;
        int id;

        void update(int a, std::string b, double p, std::string c, std::string d, std::string e, std::string f, bool g);
        void step();
};

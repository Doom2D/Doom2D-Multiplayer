// makes the plugin execude code piece #argument0
// a0 - plug_code index
if object_index == o_plugin
{
    last_exec = min(abs(argument0), 15);
    execute_string(plug_code[last_exec]);
}

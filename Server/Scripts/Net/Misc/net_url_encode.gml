//encodes url for shits n giggles
var str, res, i, len, c, n, hex;
str = argument0;
len = string_length(str);
res = "";
hex = "0123456789abcdef";
for (i = 1; i <= len; i += 1) {
    c = string_char_at(str, i);
    if (string_pos(c, ' "{}+,[]|\^~`"#%<>;/@$=:?&') > 0 || ord(c) > 126) {
        n = ord(c);
        c = '%' + string_char_at(hex, n div 16 + 1) + string_char_at(hex, n mod 16 + 1);
    }
    res += c;
}
return res;

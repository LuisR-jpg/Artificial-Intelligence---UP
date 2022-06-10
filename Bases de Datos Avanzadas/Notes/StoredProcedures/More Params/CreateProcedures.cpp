#include <bits/stdc++.h>
using namespace std;
#define f first
#define s second
int main() {
    vector<pair<string, string>> v = 
    {
        {"sql_hr", "employee"},
        {"sql_hr", "office"},
        {"sql_inventory", "product"},
        {"sql_invoicing", "client"},
        {"sql_invoicing", "invoice"},
        {"sql_invoicing", "payment_method"},
        {"sql_invoicing", "payment"},
        {"sql_store", "customer"},
        {"sql_store", "order_item_note"},
        {"sql_store", "order_item"},
        {"sql_store", "order_status"},
        {"sql_store", "order"},
        {"sql_store", "product"},
        {"sql_store", "shipper"}
    };
    for(auto p: v) {
        cout << "delimiter $$\n";
        cout << "create procedure get_" << p.s << "s_by_id(id int)\n";
        cout << "begin\n";
        cout << "    select * from " << p.f << "." << p.s << "s s where s." << p.s << "_id = id;\n";
        cout << "end$$\n";
        cout << "delimiter ;\n";
        cout << "call get_" << p.s << "s_by_id(2);\n\n";
    }
    return 0;
}
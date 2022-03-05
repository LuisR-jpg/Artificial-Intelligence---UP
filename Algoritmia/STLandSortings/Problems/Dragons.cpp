#include <bits/stdc++.h>
using namespace std;
int main(){
    int s, n;
    cin >> s >> n;
    pair<int, int> d[n+3];
    for(int i = 0; i < n; i++)
        cin >> d[i].first >> d[i].second;
    /*
    for(int i = 0; i < n; i++)
        for(int j = 0; j < n-i-1; j++)
            if(d[j].first > d[j+1].first)
                swap(d[j], d[j+1]);
    */
    sort(d, d + n);
    for(int i = 0; i < n; i++){
        if(s > d[i].first) s += d[i].second;
        else {
            cout << "NO";
            return 0;
        }
    }
    cout << "YES";
    return 0;
}
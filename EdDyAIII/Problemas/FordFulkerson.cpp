#include <iostream>
#include <queue>
#include <cstring>
#include <cstdio>
#define oo 1000000
using namespace std;
int C[500][500], F[500][500];
int parent[500], visited[500];
int source, sink, n, m, k;

bool BFS();
int fordFulkerson();
void printAugmentingPath(int);

int main() {
    cin >> n >> m >> k;
    source = n+m;
    sink = n+m+1;
    for(int a, b, i = 0; i < k; i++){
      cin >> a >> b;
      C[a][b+n] = 1;
      C[source][a] = 1;
      C[b+n][sink] = 1;
    }
    
    cout << fordFulkerson();
    return 0;
}

bool BFS() {
    memset(visited, 0, sizeof(visited));
    memset(parent, -1, sizeof(parent));
    
    queue<int> Q;
    Q.push(source);
    visited[source] = 1;

    while (!Q.empty()) {
        int k = Q.front();
        Q.pop();
        for (int i = 0; i < n+m+2; i++) {
            if (visited[i] == 0 && C[k][i] - F[k][i] > 0) {
                Q.push(i);
                visited[i] = 1;
                parent[i] = k;
            }
        }
    }
    
    return visited[sink] == 1;
}

int fordFulkerson() {
    int maxFlow = 0;
    
    while (BFS()) {
        int f = oo;
        int k = sink;
        while (parent[k] != -1) {
            int a = parent[k];
            int b = k;
            f = min(f, C[a][b] - F[a][b]);
            k = parent[k];
        }
        
        
        maxFlow += f;
        
        k = sink;
        while (parent[k] != -1) {
            int a = parent[k];
            int b = k;
            F[a][b] += f;
            F[b][a] -= f;
            k = parent[k];
        }
    }
    
    return maxFlow;
}

void printAugmentingPath(int k) {
    if (k == -1) {
        return;
    }
    
    printAugmentingPath(parent[k]);
    printf(" -> %d", k);
}

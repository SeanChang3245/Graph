#include<bits/stdc++.h>

using namespace std;

class Node;

struct edge
{
    int cost;
    Node* next;
};

class Node
{
public:
    int score;
    bool used;
    vector<edge> edges;



};



class graph
{
public:
    Node* root;
    vector<int> tmp;

    void brute(int mtime)
    {
        brute(this->root, mtime);
        sort(tmp.begin(), tmp.end(), greater<int>());
        cout << tmp[0] << endl;
        tmp.clear();
    }

    void brute(Node* current, int& mtime)
    {
        static int value = 0;
        static int ctime = 0;


        current->used = true;

        for(int i = 0; i < current->edges.size(); i++)
        {
            if(!current->edges[i].next->used)
            {
                if(current->edges[i].cost + ctime <= mtime)
                {
                    value += current->edges[i].next->score;
                    brute(current->edges[i].next, mtime);
                }
                else
                {
                    this->tmp.push_back(value);
                }

            }



        }

        current->used = false;



    }


};

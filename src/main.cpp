#include <cassert>
#include <cstdio>
#include <string>
#include "leveldb/db.h" 
#include "iostream" 
using namespace leveldb;
using namespace std;

int main(int argc, char *argv[])
{
    DB* db;
    Options options;
    options.create_if_missing = true;
    Status status = DB::Open(options, "testdb", &db);
    assert(status.ok());

    if(!status.ok()){
        cerr << status.ToString() << endl;
    }
    
    if(status.ok()){
        status = db->Put(WriteOptions(),"name1","zhangsan");
        status = db->Put(WriteOptions(),"name2","LiSi");
    }

    Iterator* it=db->NewIterator(ReadOptions());
    for(it->SeekToFirst();it->Valid();it->Next()){
        cout << it->key().ToString() << ":" << it->value().ToString() << endl;
    }

    delete db;

}


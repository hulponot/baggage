#include "consts.h"



map<int,string> setMap(int cls);


map<int, string> Consts::tripTo = setMap(1);
map<int,string> Consts::stuff = setMap(0);
map<string,vector<Coord> > Consts::roomsCoords;
map<int,vector<Coord> > Consts::doorsCoords;
map<int,vector<int> > Consts::lvlNeeds;

Consts::Consts()
{

    vector<int> coords;
    coords.push_back(1680); coords.push_back(133);
    coords.push_back(1604); coords.push_back(430);
    coords.push_back(1360); coords.push_back(850);
    coords.push_back(80); coords.push_back(870);
    coords.push_back(840); coords.push_back(420);
    coords.push_back(1640); coords.push_back(900);
    //painting
    coords.push_back(750); coords.push_back(100);
    addRoom("room-0",coords);

    //да простит господь грехи мои
    coords.push_back(140); coords.push_back(600);
    coords.push_back(500); coords.push_back(550);
    coords.push_back(842); coords.push_back(510);
    coords.push_back(1220); coords.push_back(650);
    coords.push_back(1700); coords.push_back(280);
    coords.push_back(1500); coords.push_back(580);
    //reminder
    coords.at(0) = 1600;
    coords.at(1) = 200;
    addRoom("kitchen-0",coords);

    coords.clear();
    coords.push_back(75); coords.push_back(493);
    coords.push_back(412); coords.push_back(493);
    coords.push_back(796); coords.push_back(493);
    coords.push_back(1128); coords.push_back(493);
    coords.push_back(1419); coords.push_back(13);
    //for genericRoom
    coords.push_back(1600); coords.push_back(126);
    addDoor(0,coords);

    int lvlNeedsMoution[] = {0,1,3,8,5,6};
    int lvlNeedsJungle[] = {0,1,3,7,5,6};
    int lvlNeedsForest[] = {0,1,3,4,5,6};
    lvlNeeds[0] = vector<int>(lvlNeedsMoution, lvlNeedsMoution + sizeof(lvlNeedsMoution) / sizeof(int) );
    lvlNeeds[1] = vector<int>(lvlNeedsJungle, lvlNeedsJungle + sizeof(lvlNeedsJungle) / sizeof(int) );
    lvlNeeds[2] = vector<int>(lvlNeedsForest, lvlNeedsForest + sizeof(lvlNeedsForest) / sizeof(int) );
}

Consts::~Consts()
{

}



map<int,string> setMap(int cls)
{
   map<int,string> temp;
   if (cls == 0){
       temp[0] = "knife";
       temp[1] = "lucifers";
       temp[2] = "compass";
       temp[3] = "toothBrush";
       temp[4] = "holy_water";
       temp[5] = "kettle";
       temp[6] = "phone";
       temp[7] = "antivenom";
       temp[8] = "mountion_stuff";
       temp[9] = "";
       for(int i=9;i<MAX_PLACES;i++)
           temp[i] = "nothing";
   }
   else {
       temp[0] = "mountion";
       temp[1] = "jungle";
       temp[2] = "forest";
   }
   return temp;
}


void Consts::addRoom(string title,vector<int> coords)
{
    vector<Coord> vCoords;
    for (unsigned int i=0;i<coords.size();i++){
        Coord coord;
        coord.x = coords[i++];
        coord.y = coords[i];
        vCoords.push_back(coord);
    }
    roomsCoords[title] = vCoords;
}
void Consts::addDoor(int lvl, vector<int> coords)
{
    vector<Coord> vCoords;
    for (unsigned int i=0;i<coords.size();i++){
        Coord coord;
        coord.x = coords[i++];
        coord.y = coords[i];
        vCoords.push_back(coord);
    }
    doorsCoords[lvl] = vCoords;
}

#include "levelinfo.h"
#include <iostream>


LevelInfo::LevelInfo(QObject *parent) : QObject(parent)
{
    bag = new Bag();
    iTripTo = 0;
    for (int i=0;i<MAX_PLACES;i++){
        thingOnPlace.append(i);
    }
    _levelNum = 0;
    allRight = true;
    int size = thingOnPlace.size();

    //mix
    int tempIndex,tempValue;
    for(int i=0;i<size;i++){
        tempIndex = qrand()%size;
        tempValue = thingOnPlace.at(tempIndex);
        thingOnPlace[tempIndex] = thingOnPlace.at(i);
        thingOnPlace[i] = tempValue;
    }

    for (int i=0;i<MAX_PLACES;i++){
        visible.append(true);
    }

    char buf[5];
    recordFileStream.setFileName("records.bgg");
    recordFileStream.open(QIODevice::ReadWrite);
    recordFileStream.read(buf, 5);
    record = atoi(buf);
}

LevelInfo::~LevelInfo()
{
    recordFileStream.close();
    delete bag;
}

void LevelInfo::setLevelNum(int str)
{
    _levelNum = str;
}

QString LevelInfo::getImageName(int i)
{
    if (thingOnPlace.size() <= i) return "nothing";
    string str = (Consts::stuff[thingOnPlace[i]]);
    QString qS;
    for (int i=0;i<str.size();i++)
        qS.append(str.at(i));
    return qS;
}

int LevelInfo::getX(QString room,int i)
{
    return Consts::roomsCoords[room.toStdString()][i].x;
}

int LevelInfo::getY(QString room, int i)
{
    return Consts::roomsCoords[room.toStdString()][i].y;
}
int LevelInfo::getDoorX(int lvl, int i)
{
    return Consts::doorsCoords[lvl][i].x;
}

int LevelInfo::getDoorY(int lvl, int i)
{
    return Consts::doorsCoords[lvl][i].y;
}

bool LevelInfo::isVisible(int i)
{
    return visible[i];
}

void LevelInfo::changeVisible(int i)
{
    visible[i] = !visible[i];
}

bool LevelInfo::isBagCatched()
{
    return bag->isCatched();
}

void LevelInfo::catchBag()
{
    bag->setIsCatched(true);
}

void LevelInfo::addToBag(int i)
{
    if(bag->isCatched())
        bag->add(Consts::stuff[thingOnPlace[i]]);
}

void LevelInfo::recreate()
{
    LevelInfo s;
    thingOnPlace = s.thingOnPlace;
    visible = s.visible;
}

QString LevelInfo::whatIsInBag(int i)
{
    string str = bag->whatIsIn.at(i);
    QString qS;
    for (unsigned int i=0;i<str.size();i++)
        qS.append(str.at(i));
    qS.insert(0,"bag_");
    return qS;
}

QString LevelInfo::getTripTo()
{
    if (iTripTo == -1){
        return QString("-1");
    }
    string str = Consts::tripTo[iTripTo];
    QString qS;
    for (unsigned int i=0;i<str.size();i++)
        qS.append(str.at(i));
    return qS;
}


void LevelInfo::removeFromBag(int i)
{
    int where = -1;
    for (unsigned int j=0;j< Consts::stuff.size();j++){
        if (Consts::stuff[thingOnPlace[j]] == bag->whatIsIn.at(i))
            where = j;
    }
    changeVisible(where);
    bag->remove(i);
}

bool LevelInfo::isBagFull()
{
    return ((bag->isFull() == -1) ? true : false);
}
void LevelInfo::timeExpired()
{
    if(isDoneRight()){
        recreate();
        setLevelNum(1+levelNum());
        iTripTo += 1;
        if (iTripTo>=TRIP_TO_NUM)
            iTripTo = 0;
        bag = new Bag();
        return;
    }

    if(record < (levelNum())){
        QFile out("records.bgg");
        out.open(QIODevice::ReadWrite | QIODevice::Truncate);
        char buf[5];
        sprintf(buf, "%i",(levelNum()));
       // itoa((levelNum()),buf,10);
        out.write(buf);
        out.close();
    }
    char buf[5];
    recordFileStream.close();
    recordFileStream.setFileName("records.bgg");
    recordFileStream.open(QIODevice::ReadWrite);
    recordFileStream.read(buf, 5);
    record = atoi(buf);


    iTripTo = -1;
}
bool LevelInfo::isDoneRight()
{
    int counter = 0;
    if (!isBagFull())
        return false;
    for (int i=0;i<Consts::lvlNeeds.at(0).size();i++){
        string tempThing = Consts::stuff[Consts::lvlNeeds.at(iTripTo).at(i)];

        for (int j=0;j<6;j++){
            if (bag->whatIsIn.at(j) == tempThing){
                counter++;
            }
        }
    }
    if (counter == 6)
        return true;
    return false;
}

 QString LevelInfo::getLvlNeeds(int room, int i)
 {
     string tempThing = "bag_" + Consts::stuff[Consts::lvlNeeds.at(room).at(i)];
     QString strThingName(tempThing.c_str());
     return strThingName;
 }
int LevelInfo::getRecord()
{
    return record;
}

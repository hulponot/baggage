#include "levelinfo.h"


LevelInfo::LevelInfo(QObject *parent) : QObject(parent)
{

    _test = "nothing";

    for (int i=0;i<MAX_PLACES;i++){
        thingOnPlace.append(i);
    }

    int size = thingOnPlace.size();
    int tempIndex,tempValue;
    for(int i=0;i<size;i++){
        tempIndex = rand()%size;
        tempValue = thingOnPlace.at(tempIndex);
        thingOnPlace[tempIndex] = thingOnPlace.at(i);
        thingOnPlace[i] = tempValue;
    }



    for (int i=0;i<MAX_PLACES;i++){
        visible.append(true);
    }
}

LevelInfo::~LevelInfo()
{

}

void LevelInfo::setTest(QString &str)
{
    _test = str;
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
    return bag.isCatched();
}

void LevelInfo::catchBag()
{
    bag.setIsCatched(true);
}

void LevelInfo::addToBag(int i)
{
    if(bag.isCatched())
        bag.add(Consts::stuff[thingOnPlace[i]]);
}

void LevelInfo::recreate()
{
    LevelInfo s;
    thingOnPlace = s.thingOnPlace;
    visible = s.visible;
}

QString LevelInfo::whatIsInBag(int i)
{
    string str = bag.whatIsIn.at(i);
    QString qS;
    for (int i=0;i<str.size();i++)
        qS.append(str.at(i));
    qS.insert(0,"bag_");
    return qS;
}

void LevelInfo::removeFromBag(int i)
{
    int where = -1;
    for (int j=0;j< Consts::stuff.size();j++){
        if (Consts::stuff[thingOnPlace[j]] == bag.whatIsIn.at(i))
            where = j;
    }
    changeVisible(where);
    bag.remove(i);
}

bool LevelInfo::isBagFull()
{
    return ((bag.isFull() == -1) ? true : false);
}

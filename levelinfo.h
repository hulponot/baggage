#ifndef LEVELINFO_H
#define LEVELINFO_H

#include <QObject>
#include<QString>
#include "consts.h"
#include "bag.h"
#include <QList>

using std::string;

class LevelInfo : public QObject
{
    Q_OBJECT



public:

    Q_PROPERTY(int levelNum READ levelNum WRITE setLevelNum NOTIFY levelNumChanged)

    explicit LevelInfo(QObject *parent = 0);
    ~LevelInfo();

    Q_INVOKABLE QString getImageName(int i);
    Q_INVOKABLE int getX(QString room, int i);
    Q_INVOKABLE int getY(QString room, int i);
    Q_INVOKABLE int getDoorX(int lvl, int i);
    Q_INVOKABLE int getDoorY(int lvl, int i);
    Q_INVOKABLE bool isVisible(int i);
    Q_INVOKABLE QString getTripTo();
    Q_INVOKABLE bool isBagCatched();
    Q_INVOKABLE void catchBag();
    Q_INVOKABLE void addToBag(int i);
    Q_INVOKABLE void recreate();
    Q_INVOKABLE void removeFromBag(int i);
    Q_INVOKABLE QString whatIsInBag(int i);
    Q_INVOKABLE bool isBagFull();
    Q_INVOKABLE void timeExpired();
    Q_INVOKABLE QString getLvlNeeds(int room,int i);
    void setLevelNum(int str);
    int levelNum(){return _levelNum;}
    bool isDoneRight();

signals:
    void levelNumChanged();
public slots:
        void changeVisible(int i);

private:
    int iTripTo;
    int _levelNum;
    Bag *bag;
    bool allRight;
    QList<int> thingOnPlace;
    QList<bool> visible;



};

#endif // LEVELINFO_H

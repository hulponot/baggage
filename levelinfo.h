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

    Q_PROPERTY(QString test READ test WRITE setTest NOTIFY testChanged)

    explicit LevelInfo(QObject *parent = 0);
    ~LevelInfo();

    Q_INVOKABLE QString getImageName(int i);
    Q_INVOKABLE int getX(QString room, int i);
    Q_INVOKABLE int getY(QString room, int i);
    Q_INVOKABLE bool isVisible(int i);
    Q_INVOKABLE bool isBagCatched();
    Q_INVOKABLE void catchBag();
    Q_INVOKABLE void addToBag(int i);
    Q_INVOKABLE void recreate();
    Q_INVOKABLE void removeFromBag(int i);
    Q_INVOKABLE QString whatIsInBag(int i);
    Q_INVOKABLE bool isBagFull();
    void setTest(QString &str);
    QString test(){return _test;}


signals:
    void testChanged();
public slots:
        void changeVisible(int i);

private:
    QString _test;
    Bag bag;
    QList<int> thingOnPlace;
    QList<bool> visible;



};

#endif // LEVELINFO_H

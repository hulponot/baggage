#ifndef LEVELINFO_H
#define LEVELINFO_H

#include <QObject>

class LevelInfo : public QObject
{
    Q_OBJECT
public:
    explicit LevelInfo(QObject *parent = 0);
    ~LevelInfo();

signals:

public slots:
};

#endif // LEVELINFO_H

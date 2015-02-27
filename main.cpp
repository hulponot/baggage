#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>
#include "levelinfo.h"
#include <iostream>


int main(int argc, char *argv[])
{
    //std::cout<<Consts::stuff_I[2];

    Consts consts;
    QApplication app(argc, argv);

    qmlRegisterType<LevelInfo>("MyLib",1,0,"World");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}


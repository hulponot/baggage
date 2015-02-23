#include <QApplication>
#include <QQmlApplicationEngine>
#include <qqml.h>
#include "bag.h"
#include "consts.h"
#include <iostream>


int main(int argc, char *argv[])
{
    //std::cout<<Consts::stuff_I[2];

    QApplication app(argc, argv);

    //qmlRegisterType<Bag>("MyLib",1,0,"Bag");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}


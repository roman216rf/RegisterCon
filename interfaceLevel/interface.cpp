#include "interface.h"
#include <QSqlDatabase>
#include <QDebug>

Interface::Interface(): processing(new Processing()){
    initializationApp();
}

bool Interface::checkServiceName(const QString &id, const QString &name){

    return true;
}

void Interface::initializationApp(){
    QPair<bool, QString> connectStatus = processing.get()->runConnectToDB();
    if(connectStatus.first){
        if (signIn())
    }
    else{
        emit showPopup("Ошибка", "Подключение к базе данных невозможно!\n" + connectStatus.second);
    }
}

bool Interface::signIn(){
    return processing.get()->runSignIn();
}

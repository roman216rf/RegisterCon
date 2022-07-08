#ifndef INTERFACE_H
#define INTERFACE_H

#include <QObject>
#include <processingLevel/processing.h>

class Interface: public QObject{
    Q_OBJECT

public:
    explicit Interface();
    Q_INVOKABLE bool checkServiceName(const QString& id, const QString& name);
    bool connectToDB();
    Q_INVOKABLE void initializationApp();
    Q_INVOKABLE bool signIn();

signals:
    void showPopup(const QString& title, const QString& text);

private:
    QScopedPointer<Processing> processing;
};

#endif // INTERFACE_H

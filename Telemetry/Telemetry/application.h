#ifndef APPLICATION_H
#define APPLICATION_H

#include <QtGlobal>
#include <QObject>
#include <QVector>
#include <iostream>
#include <QDataStream>



//to indicators
#define ID_temp1 1
#define ID_temp2 2
#define ID_temp3 3
#define ID_temp4 4
#define ID_speed1 5
#define ID_speed2 6
//from controls
#define ID_act_signal1 7
#define ID_act_signal2 8
#define ID_pid_p 9
#define ID_pid_i 10
#define ID_pid_d 11
#define ID_req_temp1 12
#define ID_req_temp2 13
#define ID_req_temp3 14
#define ID_req_temp4 15
#define ID_start 16
#define ID_stop 17
#define ID_self_check 18

#define ID_disconnect 19
#define ID_connect 20
#define ID_HVAC_stopped 21


#define no_of_params 8 //defines the number of parameters stored in State. temp1..4 + speed1..2


/**
* @brief The Package class
* This class defines a format for a Package received from and sent to the Communication class.
* IDs are defined to send to the controller. The payload is a QVector of quint8 which is serialized by the Comm.
*
*/
class Package
{
public:
    qint8 ID;
    QVector<quint8> payload;
    Package();
    Package(QByteArray data);
    Package(quint8 ID, quint32 data);
    Package(const Package& other);
};

QDataStream& operator<<(QDataStream& out, const Package& package);

/*---------------------------------------------------------------------*/

/**
 * @brief The Temperatures class
 * Class for the 4 measured temperatures. Will be the part of the State.
 */
class Temperatures
{
public:
    double temp1;
    double temp2;
    double temp3;
    double temp4;

    void reset();
    Temperatures& operator=(Temperatures&& other); //move assignment
    Temperatures& operator=(const Temperatures& other); //assignment
};




/*---------------------------------------------------------------------*/
/**
 * @brief The Speeds class
 * Class for the 2 measured speed values. Will be the part of the State.
 */
class Speeds
{
public:
    qint32 speed1;
    qint32 speed2;

    void reset();
    Speeds& operator=(Speeds&& other); //move assignment
    Speeds& operator=(const Speeds& other); //assignment
};

/*---------------------------------------------------------------------*/

/**
 * @brief The Actuators class
 * Class for the 2 measured actutor signal values. Will be the part of the State.
 */
class Actuators
{
public:
    qint32 act1;
    qint32 act2;

    void reset();
    Actuators& operator=(Actuators&& other); //move assignment
    Actuators& operator=(const Actuators& other); //assignment
};


#endif // APPLICATION_H


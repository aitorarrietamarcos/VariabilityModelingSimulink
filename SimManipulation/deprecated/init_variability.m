
%Script in charge of configuring the different variability points of the configurable drone case study.
%Aitor Arrieta-> aarrieta@mondragon.edu

%sys = 'SKELETON';
sys = system;

battery_type = 1; %1 = battery_short duration, =2, long duration
battery_control = 2; % 1 = there is battery_control
autoBat = false;
battery_stations =  [0 0 ; -1000 1000;  1000 1000; -1000 -1000; 1000 -1000];
            

wind_landing = 2; %Lands due to the wind -> WindAvoidance_feature
emergency_landing = 2; %EmergencySystem -> lands if there is an emergency
Collision_Avoidance = 2; %Obstacle detector -> if not, = 2;

RotorsCoefficient = 1; % 1 = low speed rotors -> 3 = high speed rotors
RotorsCoefficient_Horizontal = 0.7; % 0.7 low speed, -> 1.2 high speed rotors

control = 1; % 1 = P; 2 = PI


back_home_functionality = false;
x_home = 0;
y_home = 0;
z_home = 0;

%Removing Inputs and Outputs
remove_obstacle_input = true;
remove_person_data = true;
remove_emergency_landing = true;
remove_waypoings = true;
remove_back_home = true;
remove_flyLed = true;


%Begin reading:
%sourceFile = 'config_checking.config';
sourceFile = configuration_file;
conf = read_configuration(sourceFile);

for j=1:size(conf,2)-1;
    feature = strtok(conf(1,j));

    
    switch feature{1}
        case 'Point_To_Point'
            remove_waypoings = false;
            
        case 'PersonFollowing'
            remove_person_data = false;
        case 'ConcreteCoordenates'
            
        case 'BatteryControl'
            battery_control = 1;
        case 'AutoBattery'
            battery_stations =  [0 0 ; -1000 1000;  1000 1000; -1000 -1000; 1000 -1000];
            autoBat = true;
            
        case 'CollisionAvoidance'
            Collision_Avoidance = 1;
            remove_obstacle_input = false;

        case 'PI'
            control = 2;
        case 'P'
            control = 1;
        case 'AutoHome'
            back_home_functionality = true;
            x_home = 0;
            y_home = 0;
            z_home = 0;
            remove_back_home = false;
            
        case 'EmergencySystem'
            emergency_landing = 1;
            remove_emergency_landing = false;
            
        case 'Wind_Avoidance'
            wind_landing = 1;
            
        case 'Long_Duration'
            battery_type = 2;
            
        case 'Short_Duration'
            battery_type = 1;
            
        case 'ObSenA'
            
        case 'ObSenB'
            
        case 'ObSenC'
            
        case 'CyrA'
            Gyroscope = 1;
        case 'GyrB'
            Gyroscope = 2;
        case 'GyrC'
            Gyroscope = 3;
        case 'GPS_A'
            GPS_Sens = 1;
        case 'GPS_B'
            GPS_Sens = 2;
        case 'GPS_C'
            GPS_Sens = 3;
        case 'BS_A'
            Battery_Sensor = 1;            
        case 'BS_B'
            Battery_Sensor = 2;
        case 'BS_C'
            Battery_Sensor = 3;
        case 'HighSpeed'
           RotorsCoefficient = 3; % 1 = low speed rotors -> 3 = high speed rotors
           RotorsCoefficient_Horizontal = 1.2; % 0.7 low speed, -> 1.2 high speed rotors
            
        case 'LowSpeed'
            RotorsCoefficient = 1; % 1 = low speed rotors -> 3 = high speed rotors
            RotorsCoefficient_Horizontal = 0.7; % 0.7 low speed, -> 1.2 high speed rotors
            
        case 'Fly_Led'
            remove_flyLed = false;
            
        otherwise
            
    end
    
end

%REMOVE BLOCKS

if remove_obstacle_input == true
    delete_block([sys '/CPSUT/Obstacle']); 
    delete_block([sys '/ContextEnvironment/Obstacle']);    
end

if remove_emergency_landing == true
    delete_block([sys '/CPSUT/emergency_landing']);    
end

if remove_waypoings == true
    delete_block([sys '/CPSUT/waypoints']);    
end

if remove_back_home == true
    delete_block([sys '/CPSUT/backHome']);    
end

if remove_flyLed == true
    delete_block([sys '/CPSUT/FlyingLed']);    
end

if remove_person_data == true
    delete_block([sys '/CPSUT/Person_Data']);    
    delete_block([sys '/ContextEnvironment/Person_Data']);    

end



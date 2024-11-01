prompt = "Input direction [W/A/S/D, w/a/s/d]: ";
txt = input(prompt,"s");
distance = brick.UltrasonicDist(4);

while txt ~= "." 
    % Upper case letters = 100% speed
    if txt == "W"
        brick.MoveMotor('A', 100); % Assuming A = left motor
        brick.MoveMotor('B', 100);
        txt = input(prompt,"s");
    end
    if txt == "A"
        brick.MoveMotor('B', 100);
        txt = input(prompt,"s");
    end
    if txt == "S"
        brick.MoveMotor('A', -100); 
        brick.MoveMotor('B', -100);
        txt = input(prompt,"s");
    end
    if txt == "D"
        brick.MoveMotor('A', 100);
        brick.MoveMotor('B', 0);
        txt = input(prompt,"s");
    end

    % Lower case letters = 50% speed
    if txt == "w"
        brick.MoveMotor('A', 10); % Assuming A = left motor
        brick.MoveMotor('B', 10);
        txt = input(prompt,"s");
    end
    if txt == "a"
        brick.MoveMotor('A', 0);
        brick.MoveMotor('B', 50);
        txt = input(prompt,"s");
    end
    if txt == "s"
        brick.MoveMotor('A', -20); 
        brick.MoveMotor('B', -20);
        brick.StopAllMotors;
        txt = input(prompt,"s");
    end
    if txt == "d"
        brick.MoveMotor('A', 50);
        brick.MoveMotor('B', 0);
        txt = input(prompt,"s");
    end
    if txt == "e" || txt == "E" || txt == "END"
        brick.StopAllMotors('BRAKE');
        txt = input(prompt, "s");
    end
   if distance < 24
       brick.StopAllMotors('BRAKE');
   end
end

display(distance);
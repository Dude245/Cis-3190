--  Nathan Reymer
--  0797359

with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Numerics;
with Ada.Numerics.Discrete_Random;



procedure flesch is
    --  Declare variables, not war
    --  char: character;
    File: file_type;
    lineIn:Unbounded_String;
    --    fileName:Unbounded_String;
    --    len : Natural;
    sCount: Natural:=0;
    syCount: Natural:=0;
    wCount: Natural:=0;
    vCount: Natural:=0;
    index: Float:=0.00;
    p1: Float:=0.00;
    p2: Float:=0.00;
    peek: Natural:=0;
    doubles: Natural:=0;
    --    fileName:String(1..60);
    iIndex:Natural:=0;
begin
    New_Line;
    --Put_Line("Enter a filename: ");
    --Get_Line(fileName, len);
    --open(File,in_file,fileName(1..len));
    open(File,in_file,"test.txt");
    loop
        exit when end_of_file(File);
        get_line(File,lineIn);
        --Put_Line(lineIn);
        --lineIn:=To_Lower(lineIn);
        for i in 1..Length(lineIn) loop
            --Consecuative vowels count as 1
            if((Element(lineIn,i))='a') or ((Element(lineIn,i))='e') or ((Element(lineIn,i))='i') or ((Element(lineIn,i))='o') or ((Element(lineIn,i))='u') or ((Element(lineIn,i))='y') then
                vCount:=vCount+1;

                peek:=i+2;
                if (peek <= Length(lineIn)) then
                    if((Element(lineIn,i))='e') and ((Element(lineIn,i+1))='s') and not Is_Letter(Element(lineIn,i+2)) then
                        vCount:=vCount-1;
                        Put_Line("-ES");
                    end if;
                end if;
                peek:=i+2;
                if (peek <= Length(lineIn)) then
                    if((Element(lineIn,i))='e') and ((Element(lineIn,i+1))='d') and not Is_Letter(Element(lineIn,i+2)) then
                        vCount:=vCount-1;
                        Put_Line("-ED");
                    end if;
                end if;
                peek:=i+1;
                if (peek <= Length(lineIn)) then
                    if((Element(lineIn,i))='e') and not Is_Letter(Element(lineIn,i+1)) then
                        vCount:=vCount-1;
                        Put_Line("-E");
                    end if;
                end if;
                peek:=i+1;
                if (peek <= Length(lineIn)) then
                    if((Element(lineIn,peek))='a') or ((Element(lineIn,peek))='e') or ((Element(lineIn,peek))='i') or ((Element(lineIn,peek))='o') or ((Element(lineIn,peek))='u') or ((Element(lineIn,peek))='y') then
                        vCount:=vCount-1;
                        Put_Line("DOUBLE");
                        doubles:=doubles+1;
                    end if;
                end if;

                elsif((Element(lineIn,i))=' ') then
                    wCount:=wCount+1;
                    --Add check for Next char is char
                    if((Element(lineIn,i+1))=' ')  then
                        wCount:=wCount-1;
                    end if;
                    --Check for word length 3
                    for j in 1..3 loop
                        if((Element(lineIn,j))=' ') then
                            vCount:=vCount+1;
                        end if;
                    end loop;
                    elsif((Element(lineIn,i))='.') or ((Element(lineIn,i))='!') or ((Element(lineIn,i))='?') or ((Element(lineIn,i))=':') or ((Element(lineIn,i))=';') then
                        sCount:=sCount+1;
                    end if;
                end loop;
            end loop;
            wCount:=wCount+1;
            --sCount:=sCount-1;
            --vCount:=vCount-150;
            New_Line;
            Put_Line("Sentences: ");
            Put(Integer'Image(sCount));
            New_Line;
            Put_Line("Words: ");
            Put(Integer'Image(wCount));
            New_Line;
            Put_Line("Syllabals: ");
            Put(Integer'Image(vCount));
            New_Line;
            p1:=1.015 * Float(Float(wCount)/Float(sCount));
            p2:=84.6 * Float(Float(vCount)/Float(wCount));
            Put_Line("Flesch Index:");
            index:=206.835 - p1 - p2;
            iIndex:=Integer(index);
            Put(Integer'Image(iIndex));
            New_Line;
            Put_Line("Flesch-Kincaid Index");
            index:= 0.39 * (Float(wCount/sCount));
            index:= index + (11.8 * Float(vCount/wCount));
            index:=index - 15.59;
            iIndex:=Integer(index);
            Put(Integer'Image(iIndex));
            New_Line;
            Put_Line("DOubles:");
            Put(Integer'Image(doubles));
            close (File);
        end;

 {23. В текстовом  файле  имеется  некоторое   информационнное
письмо. Требуется сформировать ответ на письмо. Если  последнее
предложение письма является  вопросом,  начинающимся  со  слова 
"кто", то слово "кто"  заменяется  словами  "конь в пальто",  а 
знак вопроса заменяется на знак восклицания. В противном случае
нужно дать ответ: "Спасибо за информацию" (8).}

PROGRAM HorseInCoat2(INPUT, OUTPUT);
CONST
  N = 80;
  M = 15;
  FInName = 'MessageIn.txt';
  FOutName = 'MessageOut.txt';
VAR
  Sentence: ARRAY[1 .. N] OF STRING;
  Txt: ARRAY[1 .. M] OF STRING;
  Sent, LetterBegin, LetterEnd: STRING;
  FIn, FOut: TEXT;
  I, J, K, Flag: INTEGER;
  Ch: CHAR;
BEGIN
  I := 1;
  J := 1;
  K := 1;
  ASSIGN(FIn, FInName);
  RESET(FIn);
  WHILE NOT EOF(FIn)
  DO
    BEGIN
    READ(FIn, Ch);
    IF (Ch <> '?') AND (Ch <> '!') AND (Ch <> '.')
    THEN
      BEGIN
        Sentence[I] := Sentence[I] + Ch 
      END
    ELSE
      BEGIN
        Sentence[I] := Sentence[I] + Ch ;
        I := I + 1  
      END
    END;
    I:= I - 1;
    Sent := Sentence[I];
    WRITELN(Sent);
    IF Sent[LENGTH(Sent)] = '?'
    THEN
      BEGIN
        Sent[LENGTH(Sent)] := '!';
        FOR K := 1 TO LENGTH(Sent)
        DO
          BEGIN
            IF Sent[k] <> ' '
            THEN
              LetterBegin := LetterBegin + Ch
            ELSE
              BEGIN 
                IF (LetterBegin = 'Кто') OR
                   (LetterBegin = 'кто') OR
                   (LetterBegin = 'КТО')
                THEN
                  BEGIN
                    LetterBegin:= 'Конь в пальто';
                    
                  END
                ELSE 
                  BEGIN
                    WRITE('Спасибо за информацию!'); //вот здесь че то не так           
                  END
              END
          END
      END
    ELSE
      BEGIN
        WRITE('Спасибо за информацию!');
        EXIT
      END;
    FOR J := 1 to I - 1
    DO
      BEGIN
        WRITE(Sentence[J])
      END;
      WRITE('//Конь в пальто //');
    FOR J := 3 TO LENGTH(Sent)
    DO
      BEGIN
        WRITE(Sent[J])
      END;
END.
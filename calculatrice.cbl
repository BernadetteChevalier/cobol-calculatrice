      * BRIEF CALCULATRICE 
       IDENTIFICATION DIVISION.
           PROGRAM-ID. CALCULATRICE.
           AUTHOR. BPIRLET.
           DATE-WRITTEN. 20250430.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-OPERATEUR PIC X(2).
       01 WS-NOMBRE1 PIC 9(3).
       01 WS-NOMBRE2 PIC 9(3).
       01 WS-RESULTAT PIC -Z(6).
       01 WS-CONTINUER PIC X VALUE "O".
      * 01 WS-DIVZERO PIC X VALUE "N".

       PROCEDURE DIVISION.
           DISPLAY "CALCULATRICE COBOL".

           PERFORM UNTIL WS-CONTINUER = "N"
           
               DISPLAY "ENTREZ LE PREMIER NOMBRE :"
               ACCEPT WS-NOMBRE1
               
               DISPLAY "ENTREZ LE DEUXIEME NOMBRE :"
               ACCEPT WS-NOMBRE2
      
               DISPLAY "ENTREZ LOPERATEUR (+, -, *, /) :"
               ACCEPT WS-OPERATEUR
      
               DISPLAY "CALCUL EN COURS"
               DISPLAY WS-NOMBRE1  WS-OPERATEUR WS-NOMBRE2 WS-RESULTAT
     

               EVALUATE WS-OPERATEUR
                   WHEN "+"
                       PERFORM START-ADDIT-PARA 
                      THRU END-ADDIT-PARA
       
                   WHEN "-"
                       PERFORM START-SOUST-PARA 
                      THRU END-SOUST-PARA
                   
                   WHEN "*"
                       PERFORM START-MULT-PARA 
                       THRU END-MULT-PARA
      
                   WHEN "/"
                       PERFORM START-DIV-PARA 
                       THRU END-DIV-PARA
      
                   WHEN OTHER 
                       DISPLAY "CALCUL IMPOSSIBLE"     
               END-EVALUATE
      
                   DISPLAY "FAIRE UN AUTRE CALCUL? (O/N)"
                   ACCEPT WS-CONTINUER
           END-PERFORM.
           

           DISPLAY "FIN DU PROGRAMME".
           STOP RUN.
      * ....................PARAGRAPHES.............................

           START-ADDIT-PARA.
           COMPUTE WS-RESULTAT = WS-NOMBRE1 + WS-NOMBRE2.
           DISPLAY "=" FUNCTION TRIM(WS-RESULTAT).
           END-ADDIT-PARA. 
           EXIT.

           START-SOUST-PARA.
           COMPUTE WS-RESULTAT = WS-NOMBRE1 - WS-NOMBRE2.
           DISPLAY "=" FUNCTION TRIM(WS-RESULTAT).
           END-SOUST-PARA. 
           EXIT.

           START-MULT-PARA.
           COMPUTE WS-RESULTAT = WS-NOMBRE1 * WS-NOMBRE2.
           DISPLAY "=" FUNCTION TRIM(WS-RESULTAT).
           END-MULT-PARA.
           EXIT. 

           START-DIV-PARA.
           COMPUTE WS-RESULTAT = WS-NOMBRE1 / WS-NOMBRE2.
           DISPLAY "=" FUNCTION TRIM(WS-RESULTAT).
           END-DIV-PARA.
           EXIT. 

           STOP RUN.




DECLARE
	CURSOR C1 IS 

	VCURSOR CURSOR%ROWTYPE;
BEGIN
	open C1

	WHILE C1%FOUND LOOP
		FETCH C1 INTO VCURSOR;
		IF VCURSOR.MEDIA >= 7 AND VCURSOR.FALTAS<(VCURSOR.CARGA_HORA*0.25) THEN
			VCURSOR.RESULTADO = 'APROVADO'
		END IF;
		ELSE IF VCURSOR<7 AND VCURSOR.FALTAS<(VCURSOR.CARGA_HORA*0.25) THEN
			VCURSOR.RESULTADO = 'EXAME'
		END IF;
		ELSE
			'REPROVADO'
		END IF;
	END LOOP;

	CLOSE C1;

END;
DECLARE @count INT;
SET @count = 1;
    
WHILE @count<= 10
BEGIN
   INSERT INTO Cars VALUES('Car-'+CAST(@count as varchar), @count*100)
   SET @count = @count + 1;
END;
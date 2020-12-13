CREATE PROCEDURE [dbo].[LastTKSegments]
@inputGdsPnr varchar(6),
@inputBookingId bigint
AS

DECLARE @routeIter varchar(6)
DECLARE @statusIter varchar(2)
DECLARE @unID bigint
DECLARE @tkID bigint
DECLARE @unTid datetime /* tid Danish for time */
DECLARE @tkTid datetime
DECLARE @finalTkSegments TABLE (segRoute varchar(6),departsAt datetime)

DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = @inputGdsPnr AND bookingId = @inputBookingId
OPEN routeCursor;

FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	SET @tkID = (SELECT TOP 1 id FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC)
	SET @tkTid = (SELECT TOP 1 gdsNotifiedAt FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC)
	SET @unID = (SELECT TOP 1 id FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC)
	SET @unTid = (SELECT TOP 1 gdsNotifiedAt FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC)
			
	IF DATEDIFF(day, @unTid,@tkTid) >=0 AND @tkID IS NOT NULL AND @unID IS NOT NULL
	BEGIN
		INSERT INTO @finalTkSegments 
		SELECT route,departs_at FROM notification_history WHERE id = @tkID
	END
	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
SELECT * FROM @finalTkSegments ORDER BY departsAt ASC
GO
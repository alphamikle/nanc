DECLARE
    result text;
BEGIN
if returnable = true then
EXECUTE query INTO result;
RETURN result;
else
execute query;
return '';
end if;
END;
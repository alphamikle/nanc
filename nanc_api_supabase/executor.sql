DECLARE response text;

BEGIN
    if executorReturnableArgumentName = true then
        EXECUTE executorSqlArgumentName INTO response;
        RETURN response;
    else
        execute executorSqlArgumentName;
        return '';
    end if;
END;
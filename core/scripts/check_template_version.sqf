/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/

private _templateVersion = getMissionConfigValue ["TEMPLATE_VERSION", "0.0.0"];
private _templateData    = getMissionConfigValue ["TEMPLATE_LAST_UPDATE", "00-00-0000"];
private _authorUID       = parseSimpleArray getMissionConfigValue ["AUTHOR_UID", ""];
private _floatDataDB     = 0;
private _floatData       = 0;
private _versionDB       = call compile preprocessFileLineNumbers "core\scripts\db\querys\get_template_version.sqf";
private _dataDB          = [(_versionDB select 1) select 0, (_versionDB select 1) select 1, (_versionDB select 1) select 2, 0, 0];
private _dataTemplate    = _templateData splitString "-";

_dataTemplate = [parseNumber (_dataTemplate select 0), parseNumber (_dataTemplate select 1), parseNumber (_dataTemplate select 2), 0, 0];

if (_dataDB select 0 != _dataTemplate select 0) then {
    _floatDataDB = (_dataDB select 0) + dateToNumber _dataDB;
    _floatData   = (_dataTemplate select 0) + dateToNumber _dataTemplate;
} else {
    _floatDataDB = dateToNumber _dataDB;
    _floatData   = dateToNumber _dataTemplate;
};

if (_floatDataDB > _floatData) then {
    [_authorUID,"core\scripts\screenWarning.sqf"] remoteExec ["BIS_fnc_execVM", 0, false];
};

/*******************************************************************************
                          Realizado por |ArgA|MIV
*******************************************************************************/
// ["VERSION_DB:", _versionDB] call MIV_fnc_log;
// ["_templateData:", _templateData] call MIV_fnc_log;
// ["_dataTemplate: ", _dataTemplate] call MIV_fnc_log;
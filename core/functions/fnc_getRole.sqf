/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

private _defaultRoleList = parseSimpleArray getMissionConfigValue ["AUXILIAR_ROLE_LIST", '[]'];

params [["_unit", player], ["_roleList", _defaultRoleList]];
/*{
    ["_roleList 1:", _x] call MIV_fnc_log;
} forEach _roleList;
*/
if (count(_roleList) == 0) then { _roleList = _defaultRoleList};

private _role = _unit getVariable ["MANDI_ROL", "desconocido"];

if (typeName _role != "SCALAR") then {
    if (_role == "desconocido" && !isNil "_unit") then { 
        //private ["_code", "_roleName", "_description"];
        private ["_description"];
        _description = ((toLower roleDescription _unit) splitString "@") select 0;
        if (!isNil "_description") then {
            _description = [_unit, _description] call MIV_fnc_parseRole;
            _role   =   [_description,_roleList] call MIV_fnc_getRoleCode;
            if (_role != "") then{
                _unit setVariable ["MANDI_ROL", _role];
            };
        };
    };
};

_role;

/*******************************************************************************
                            Realizado por |ArgA|MIV
*******************************************************************************/

/*
 Detectar si en roleDescription esta el tag #nc, segun el resultado, setear
 el atributo MIV_NO_CHANGE al valor correspondiente en la unidad.

 Si el tag #nc esta presente, quitarlo de la string de comparación. (_description)
 (checkear que el tag pueda estar al principio, final, medio, cualquier lado. y quitarlo bien.)

 Detectar esta variable (con default False) en la funcion que setea el rol y actuar como corresponda.
*/

/*
    [
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
        ["rol", codigo, id],
    ]

*/



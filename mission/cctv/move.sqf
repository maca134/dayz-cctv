private ["_cam", "_positions"];

_cam = _this select 0;
_positions = _this select 1;

while {true} do {
	_cam camSetTarget (_positions select 1);
	_cam camCommit CCTV_time_int;
	waitUntil {camCommitted _cam};
	sleep CCTV_time_int;

	_cam camSetTarget  (_positions select 0);
	_cam camCommit CCTV_time_int;
	waitUntil {camCommitted _cam};
	sleep CCTV_time_int;
};
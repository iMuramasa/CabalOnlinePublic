//Day and Night mode
BOOL OnLogged()
{
	if (*(DWORD*)0x00B93530 > 0x100000)
		return *(DWORD*)((*(DWORD*)0x00B93530) + 0x4810);

	return FALSE;
}
/////////////////////////////////////////////////////////
void ModDayandNight()
{
	BOOL ModStats = FALSE;
	while (true)
	{
		if (GetAsyncKeyState(VK_F10) & 0x8000 && OnLogged())
		{
			if (ModStats)
			{
				*(DWORD*)0x1083838 = 0;
				ModStats = FALSE;
				CabalDrawText(pPrintClass, "$40#Ночной режим:$ $48#Деактирован", 0x1C, 7);
				Sleep(200);
			}
			else
			{
				*(DWORD*)0x1083838 = 1;
				ModStats = TRUE;
				CabalDrawText(pPrintClass, "$40#Ночной режим:$ $48#Активирован", 0x1C, 7);
				Sleep(200);
			}
		}
		Sleep(50);
	}
}

//////////////////////////////////////////////////////////////////////////////////
		CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)ModDayandNight, NULL, NULL, NULL);

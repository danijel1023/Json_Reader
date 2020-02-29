#include "..//json_reader/src/json.h"

int main() {
    std::cout << "-- Starting Program -----------" << std::endl;
    Json Main;

    {
        Json Temp;
        std::wcout << "Loading json tree to 'Temp'..." << std::endl;
        Temp.Init(L"e32.json");
        std::wcout << "--Done" << std::endl;

        std::wcout << "'Temp' tree structure:" << std::endl;
        std::wcout << Temp.Root().Get_Tree().str() << std::endl;
        std::wcout << "--Done" << std::endl;

        std::wcout << "Copying tree..." << std::endl;
        Main = (Temp.Root().Arr(0));
        std::wcout << "--Done" << std::endl;

        std::wcout << "'Main' tree structure:" << std::endl;
        std::wcout << Main.Root().Get_Tree().str() << std::endl;
        std::wcout << "--Done" << std::endl;
    }
    std::wcin.get();
}

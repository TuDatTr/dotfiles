/*  ______  _________ _______  _______  _        _______ _________ _______  _______  _______ 
 * (  __  \ \__   __/(  ____ \(  ____ \( \      (  ___  )\__   __/(       )(  ____ \(  ____ )
 * | (  \  )   ) (   | (    \/| (    \/| (      | (   ) |   ) (   | () () || (    \/| (    )|
 * | |   ) |   | |   | (_____ | |      | |      | (___) |   | |   | || || || (__    | (____)|
 * | |   | |   | |   (_____  )| |      | |      |  ___  |   | |   | |(_)| ||  __)   |     __)
 * | |   ) |   | |         ) || |      | |      | (   ) |   | |   | |   | || (      | (\ (   
 * | (__/  )___) (___/\____) || (____/\| (____/\| )   ( |___) (___| )   ( || (____/\| ) \ \__
 * (______/ \_______/\_______)(_______/(_______/|/     \|\_______/|/     \|(_______/|/   \__/
 * 
 * 
 * THIS IS GARBAGE CODE AND I KNOW IT. 
 * I KNOW ABSOLUTLY NOTHING ABOUT C++ AND JUST FRANKENSTEINED
 * A BUNCH OF CODE SAMPLES, USING MY PYTHON CODE AS A TEMPLATE.
 */

#include <sys/types.h>
#include <unistd.h>
#include <pwd.h>
#include <dirent.h>
#include <errno.h>
#include <vector>
#include <string>
#include <fstream>
#include <iostream>

using namespace std;

int getdir(string dir, vector<string> &files){
  DIR *dp;
  struct dirent *dirp;
  if((dp = opendir(dir.c_str())) == NULL){
    cout << "Error(" << errno << ") opening " << dir << endl;
    return errno;
  }

  while ((dirp = readdir(dp)) != NULL){
    files.push_back(string(dirp->d_name));
  }
  closedir(dp);
  return 0;
}

string getfile(string file_path){
  ifstream inFile;
  string file_content;
  inFile.open(file_path);
  if(!inFile){
    return "";
  }
  inFile >> file_content;
  return file_content;
}

bool spotify_running(){
  string dir = string("/proc/");
  vector<string> processes = vector<string>();
  getdir(dir, processes);
  string proc_name = string("");
  for (unsigned int i = 0; i < procs.size(); i++){
    proc_name = dir + procs[i] + "/cmdline";
    if(getfile(proc_name).find(string("/usr/bin/spotify")) != string::npos){
      return true;
    }
  }
  return false;
}

int main(){
  //
  struct passwd *pw = getpwuid(getuid());
  const char *homedir = pw->pw_dir;
  int state = -1;
  int playstate = 0;
  string playstate_file = "";
  playstate_file += homedir + string("/.scripts/playstate");
  while (spotify_running()){
    usleep(100000);
    // cout << spotify_running() << endl;
    playstate = stoi(getfile(playstate_file));
    if(playstate != state){
      state = playstate;
      if (state == 0){
	cout << "" << endl;
	system("playerctl pause");
      }
      else if (state == 1){
	cout << "" << endl;
	system("playerctl play");
      }
    }
  }
  cout << endl;
}

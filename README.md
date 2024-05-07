# Wiggle-Mouse

Wiggle-Mouse is a lightweight utility designed to non-intrusively move the mouse cursor every 5 minutes. This simple action prevents Windows session timeouts due to inactivity.

- **Runs in the Background:** The utility opens a subprocess so you can run it from a pipeline without blocking the pipeline.
- **Singleton Execution:** Ensures that multiple instances do not interfere with each other; running the script multiple times won't result in overlapping actions.
- 
## Usage

### Download Wiggle-Mouse.cmd
1. Navigate to the main page of the GitHub repository: [Wiggle-Mouse](https://github.com/AutoActuary/Wiggle-Mouse)
2. Locate the `Wiggle-Mouse.cmd` file in the repository file list.
3. Click on `Wiggle-Mouse.cmd` to open the file view.
4. Click the `Download` button to download the script to your local machine.

### Run the Script
1. Locate the downloaded `Wiggle-Mouse.cmd` file on your computer (usually in your Downloads folder).
2. Double-click the file to run it. A minimized command prompt window should open, and the script will start running.
3. The script will now automatically wiggle the mouse cursor every 5 minutes to keep your Windows session active.

### Autostart on Windows
If you want the script to run automatically when you start your computer:
1. Press `Win + R` to open the Run dialog.
2. Type `shell:startup` and press Enter to open the Startup folder.
3. Place `Wiggle-Mouse.cmd` or a shortcut to `Wiggle-Mouse.cmd` file in this folder.

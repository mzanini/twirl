# Twirl
A simple electron application to roll die

## Build
Generate the Windows executable (Squirrel):
```bash
docker-compose -f docker-compose.win.yml run twirl
yarn && yarn release
```
The executable will be created inside the `dist` directory

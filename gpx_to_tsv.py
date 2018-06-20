# A script taking all .gpx files from current folder and producing a tsv (tab-separated value) file with the id, coordinates, elevation, and time of all waypoint from these files.
# Warning: I have not tested it, but I suppose the presense of files with something else rather than simple waypoints will cause an error

import gpxpy
import glob

#get filenames of all gpx in the current directory
files = sorted(glob.glob('*.gpx'))

#loop over these files
output = open('waypoins.txt','w')
output.write('name\tlat\tlon\televation\ttime\n')
for file in files:
	gpx_file = open(file,'r') 
	gpx = gpxpy.parse(gpx_file)
	for waypoint in gpx.waypoints:
		l = '{0}\t{1}\t{2}\t{3}\t{4}\n'.format(waypoint.name, waypoint.latitude, waypoint.longitude, waypoint.elevation, waypoint.time)
		output.write(l)

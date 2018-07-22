al = var('al')  # angle between rotation and magnetic axes
ze = var('ze')  # angle between rotation axis and line of sight
si = var('si')  # magnetic azimuth

assume(al,'real')
assume(ze,'real')
assume(si,'real')

assume(al>0)
assume(ze>0)

This directory will be helpful in understanding networks in a hands on manner. This directory contains packet capture(s)
Packet capture, or PCAP, is a networking technique that involves intercepting and recording data packets traveling over a network.
Packet capturing helps to analyze networks, identify network performance issues and manage network traffic.

You can capture your own packet capture or view the given files using `Wireshark`

To run wireshark use the command `sudo wireshark` in your terminal.

View existing files:
	File->Open, Chose the file in the explorer pop-up

Create your own capture:
	Capture->Start
	If the capture is empty, you might have to modify the interface used as:
		Capture->Options, Try other interfaces, starting with eth.
	*If it still doesn't capture let us know!*

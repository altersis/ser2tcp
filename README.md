# ser2tcp
 This is a Home Asistant Add-on that creates a TCP to Serial bridge on your home Assistant server

 Some Home Assistant (HASS) integrations connect with devices that natively use RS-232 links, like Russound RNET. The integration assumes that the controlled device will be connected via TCP to a physically distant Home Assistant server, and could be very convenient. A TCP to Serial bridge is needed at the controlled device. In cases where the controlled device is right next to the Home Assistant server, it does not make a lot of sense to invest on a TCP to Serial bridge (for example a Digi or Global Caché one). This Add on acts a TCP 2 Serial bridge reducing the cost and complexity of the install in those circumstances. 

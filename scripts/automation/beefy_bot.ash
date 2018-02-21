//Bot script

import "do_clanfortune.ash";
import "drachs_tools.ash";


void main(string sender, string message, string channel)
{
	//lowercase versions of messages
	string chan = channel.to_lower_case();
	string sndr = sender.to_lower_case();
	string msg = message.to_lower_case();

	print_html("Chatbot received message from %s, message %s, on channel %s", string [int]{sender,message,channel});
	//event strings
	string vip_fortune_msg = "You have been invited to consult Madame Zatara about your relationship";

	if(sndr == "stewbeef")
	{
		chat_private("stewbeef","message received");
	}
	if(channel.to_lower_case() == "events")
	{//message events
		if(message.contains_text(vip_fortune_msg))
		{
			//print("Responding to fortune message");
			return_all_fortunes();
		}
	}


}
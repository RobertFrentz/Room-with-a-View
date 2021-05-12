using System;

namespace RoomManagementMicroservice.Utils
{
    public class Description
    {
        public string Text { get; set; }
        public Description(int number)
        {
            switch (number)
            {
                case 0:
                    Text = "Comfort, style and functionality are the words that can describe our standard double rooms. " +
                            "Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed " +
                            "and a spacious balcony where you can enjoy your morning coffee.";
                    break;
                case 1:
                    Text = "Comfort, style and functionality are the words that can describe our standard triple rooms. " +
                            "Hotel Iasi Royal Residence invites you to enjoy your stay in a spacious room with a QueenSize double bed," +
                            " a single bed and a spacious balcony where you can enjoy your morning coffee.";
                    break;
                case 2:
                    Text = "Deluxe Room is the answer to your expectations from our hotel room. " +
                            "The surface of 22 sqm with a maximum capacity of 2 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has." +
                            "The stylish, non-smoking room is equipped with a queen size bed and a flat - screen TV with international channels." +
                            "Bathrobes and slippers are available for added comfort.";
                    break;
                case 3:
                    Text = "Deluxe Room is the answer to your expectations from a hotel room." +
                            "The surface of 22 sqm with a maximum capacity of 3 people, is decorated in a minimalist style with a lot of good taste, and the room is flooded with light through the generous window it has." +
                            "The stylish, non-smoking room is equipped with a queen size bed, single bed and a flat-screen TV with international channels." +
                            "Bathrobes and slippers are available for added comfort.";
                    break;
                case 4:
                    Text = "Thoughtfully designed suite room." +
                            "Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 3 people." +
                            "Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.";
                    break;
                case 5:
                    Text = "Thoughtfully designed suite room." +
                            "Two peaceful and spacious art deco rooms with King size four posture canopy bed &separate sitting and living room for 4 people." +
                            "Offers a separate living area, private balcony overlooking the lush garden or lively town, flat screen TV with international channels and free WiFi.";
                    break;
                default:
                    Console.WriteLine("Default case");
                    break;
            }
        }
    }
}

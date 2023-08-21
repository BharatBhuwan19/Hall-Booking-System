using Google.Apis.Auth.OAuth2;
using Google.Apis.Calendar.v3;
using Google.Apis.Services;
using System.IO;

namespace YourNamespace
{
    public static class GoogleCalendarConfig
    {
        public static CalendarService GetCalendarService()
        {
            string jsonFilePath = @"C:\Users\BHUVAN\source\repos\Hall Booking System\Hall Booking System\App_Data\calendar-integration-388311-4448c9b8a7e7.json";

            GoogleCredential credential;
            using (var stream = new FileStream(jsonFilePath, FileMode.Open, FileAccess.Read))
            {
                credential = GoogleCredential.FromStream(stream)
                    .CreateScoped(CalendarService.Scope.Calendar);
            }

            return new CalendarService(new BaseClientService.Initializer
            {
                HttpClientInitializer = credential,
                ApplicationName = "Hall Calendar"
            });
        }
    }
}

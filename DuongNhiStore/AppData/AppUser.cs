using Microsoft.AspNetCore.Identity;

namespace DuongNhiStore.AppData
{
    public class AppUser : IdentityUser
    {
        public String? FirstName { get; set; }
        public String? LastName { get; set; }
        public String? NumberPhone { get; set; }
        public String? Address { get; set; }

    }
}

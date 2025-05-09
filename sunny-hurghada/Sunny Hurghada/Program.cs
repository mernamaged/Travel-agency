using Microsoft.EntityFrameworkCore;
using Sunny_Hurghada.Managers;
using Sunny_Hurghada.Middleware;
using Sunny_Hurghada.Models;

namespace Sunny_Hurghada
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            // Add services to the container.
            builder.Services.Configure<RequestLocalizationOptions>(options =>
            {
                var supportedCultures = new[]
                { 
                    "en-GB",
                    "de-DU",
                    "ru-RU"
                };
                options
                    .AddSupportedCultures(supportedCultures)
                    .AddSupportedUICultures(supportedCultures)
                    .SetDefaultCulture("en-GB");
            });

            builder.Services.AddDbContext<SunnyHurghadaContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"))); // Use your connection string

            builder.Services.AddScoped<DestinationManager>();
            builder.Services.AddScoped<TourManager>();
            builder.Services.AddScoped<TransferManager>();
            builder.Services.AddScoped<GuestManager>();


            // Add services to the container.
            builder.Services.AddRazorPages();

            var app = builder.Build();
            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseMiddleware<RequestCultureMiddleware>();
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();
            app.UseRequestLocalization();

            app.UseAuthorization();

            app.MapRazorPages();
            app.Run();
        }
    }
}

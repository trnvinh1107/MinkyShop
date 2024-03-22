using System;
using System.Collections.Generic;

namespace MinkyShop.Models;

public partial class Admin
{
    public string UserAdmin { get; set; } = null!;

    public string PassAdmin { get; set; } = null!;

    public string? HoTen { get; set; }
}

﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Sunny_Hurghada.Models;

public partial class TourLocalized
{
    public int LanguageId { get; set; }

    public int TourId { get; set; }

    public string Name { get; set; }

    public string Description { get; set; }

    public string Includes { get; set; }

    public string Excludes { get; set; }

    public string WhatToBring { get; set; }

    public virtual Language Language { get; set; }

    public virtual Tour Tour { get; set; }
}
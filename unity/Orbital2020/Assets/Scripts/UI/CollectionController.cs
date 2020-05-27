﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CollectionController : MonoBehaviour, UIScreen
{
    public GameObject uiObject;

    public void Open()
    {
        uiObject.SetActive(true);
    }

    public void Close()
    {
        uiObject.SetActive(false);
    }
}

package com.lapser;

import com.calatrava.CalatravaPage;
import com.calatrava.shell.WebViewActivity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@CalatravaPage(name = "homePage")
public class HomePage extends WebViewActivity
{
  @Override
  protected String getPageName() {
    return "homePage";
  }

  @Override
  protected List<String> getEvents() {
    return Arrays.asList("start");
  }

  @Override
  protected List<String> getFields() {
    return Arrays.asList();
  }
}

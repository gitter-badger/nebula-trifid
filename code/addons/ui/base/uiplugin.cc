//------------------------------------------------------------------------------
//  uiplugin.cc
//  (C) 2015 Individual contributors, see AUTHORS file
//------------------------------------------------------------------------------
#include "stdneb.h"
#include "ui/base/uiplugin.h"

namespace UI
{
__ImplementClass(UI::UiPlugin, 'UIPG', Core::RefCounted);
	

//------------------------------------------------------------------------------
/**
*/
UiPlugin::UiPlugin()
{
	// empty
}

//------------------------------------------------------------------------------
/**
*/
UiPlugin::~UiPlugin()
{
	// empty
}

//------------------------------------------------------------------------------
/**
*/
void
UiPlugin::OnRegister()
{
	// empty
}

//------------------------------------------------------------------------------
/**
*/
void
UiPlugin::OnUnregister()
{
	// empty
}

//------------------------------------------------------------------------------
/**
*/
void
UiPlugin::OnRenderFrameBatch(const Ptr<Frame::FrameBatch>& frameBatch)
{
	// empty
}
}


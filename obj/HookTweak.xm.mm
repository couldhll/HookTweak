#line 1 "HookTweak.xm"
#include <CydiaSubstrate.h>
#include <objc/runtime.h>

static IMP (*original_method_setImplementation)(Method m, IMP imp);

OBJC_EXPORT IMP replaced_method_setImplementation(Method m, IMP imp)
{
    IMP result=nil;
printf(">>>>>>>>>>>>>>>>>>Calling original method");
    
    original_method_setImplementation(m,imp);

    return result;
}

static __attribute__((constructor)) void _logosLocalCtor_9bf31c7f()
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    MSHookFunction(method_setImplementation, replaced_method_setImplementation, &original_method_setImplementation);
    void * handle = dlopen("/Library/MobileSubstrate/DynamicLibraries/ActionMenu.dylib", RTLD_NOW);
    
    [pool drain];
}

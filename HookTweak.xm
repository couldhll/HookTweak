#include <CydiaSubstrate.h>
#include <objc/runtime.h>

static IMP (*original_method_setImplementation)(Method m, IMP imp);

OBJC_EXPORT IMP replaced_method_setImplementation(Method m, IMP imp)
{
    IMP result=nil;
printf(">>>>>>>>>>>>>>>>>>Calling original method");
    // printf(">>>>>>>>>>>>>>>>>>Calling original method(%p)...", m);
    original_method_setImplementation(m,imp);

    return result;
}

%ctor
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    MSHookFunction(method_setImplementation, replaced_method_setImplementation, &original_method_setImplementation);
    void *handle = dlopen("/Library/MobileSubstrate/DynamicLibraries/ActionMenu.dylib", RTLD_NOW);
    real_f = (fType) dlsym(handle,"f");
    [pool drain];
}
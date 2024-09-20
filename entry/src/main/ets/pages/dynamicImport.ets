



/// 动态import根据入参是常量还是变量，分成动态import常量表达式和动态import变量表达式两大特性规格
/// 动态import常量表达式是指动态import的入参为常量的场景
/// 变量动态import需要额外增加一个runtimeOnly的buildOption配置，用于配置动态import的变量实际的模块名或者文件路径。
/// (在HAP/HSP/HAR的build-profile.json5中的buildOption中增加runtimeOnly配置项)
///
///
/// 动态import
export function dynamicImpart() {

  /// 变量动态import本模块自己的单文件src/main/ets/Home/HomePage.ets
  import('./Home/HomePage').then((ns: ESObject) => {

  })

  /// 动态import其他模块FirstTestSharelibrary
  import('FirstTestSharelibrary').then((ns:ESObject) => {
    ns.Calc.staticAdd(8, 9);  // 调用静态成员函数staticAdd()
    let calc:ESObject = new ns.Calc();  // 实例化类Calc
    calc.instanceAdd(10, 11);  // 调用成员函数instanceAdd()
    ns.addHarlibrary(6, 7);  // 调用全局方法addHarlibrary()

    // 使用类、成员函数和方法的字符串名字进行反射调用
    let className = 'Calc';
    let methodName = 'instanceAdd';
    let staticMethod = 'staticAdd';
    let functionName = 'addHarlibrary';
    ns[className][staticMethod](12, 13);  // 调用静态成员函数staticAdd()
    let calc1:ESObject = new ns[className]();  // 实例化类Calc
    calc1[methodName](14, 15);  // 调用成员函数instanceAdd()
    ns[functionName](16, 17);  // 调用全局方法addHarlibrary()
  });
}

/// HAP变量动态import加载API，变量动态import加载API时无需配置runtimeOnly。
function api() {
  // HAP's src/main/ets/pages/Index.ets
  let packageName = '@system.app';
  import(packageName).then((ns:ESObject) => { ns.default.terminate(); });
  packageName = '@system.router';
  import(packageName).then((ns:ESObject) => { ns.default.clear(); });
  packageName = '@ohos.curves';
  import(packageName).then((ns:ESObject) => { ns.default.springMotion(0.555, 0.75, 0.001); });
  packageName = '@ohos.matrix4';
  import(packageName).then((ns:ESObject) => { ns.default.identity(); });
  packageName = '@ohos.hilog';
  import(packageName).then((ns:ESObject) => { ns.default.info(0x0000, 'testTag', '%{public}s', 'DynamicImport @ohos.hilog.'); });
}


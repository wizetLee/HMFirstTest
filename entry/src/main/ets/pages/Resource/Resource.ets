@Entry({ routeName: "ResourcePage" })
@Component
struct ResourcePage {
  componentName = "ResourcePage"

  //Entry 生命周期
  onPageShow(): void {
    console.log(`${this.componentName} - onPageShow`)
    this.checkResource()
  }

  onPageHide(): void {
    console.log(`${this.componentName} - onPageHide`)
  }

  //Component 生命周期
  aboutToAppear(): void {
    console.log(`${this.componentName} - aboutToAppear`)
  }

  aboutToDisappear(): void {
    console.log(`${this.componentName} - aboutToDisappear`)
  }

  // aboutToReuse(params: { [key: string]: Any }): void {
  // }
  aboutToRecycle(): void {
    console.log(`${this.componentName} - aboutToRecycle`)
  }

  build() {

  }

  checkResource() {
    let value: Resource = $r("app.float.this_is_float_value")
    console.log(`resource value.bundleName: ${value.bundleName}`)
    console.log(`resource value.moduleName: ${value.moduleName}`)
    console.log(`resource value.id: ${value.id}`)
    console.log(`resource value.params: ${value.params}`)
    console.log(`resource value.type: ${value.type}`)
    console.log(`resource typeof value: ${typeof value}`)


    //other
    $r("app.media.layered_image")
    // $r("app.profile.main_pages")


    // https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-resource-manager-V5
    let rid = $r("app.color.start_window_background").id
    // getContext().resourceManager.get

    let colorID = getContext().resourceManager.getColorSync(rid);
    console.log("")


    // 跨HAP/HSP包应用资源访问
    $r("[FirstTestShareLibrary].string.shared_desc")


    // about rawfile
    // https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/rawfile-guidelines-V5
    $rawfile("RowFileString.json")
    $rawfile("dir/raw_file_test")


    // 系统内置的资源
    $r('sys.color.ohos_id_color_emphasize')
    $r('sys.float.ohos_id_text_size_headline1')
    $r('sys.string.ohos_id_text_font_family_medium')
    $r('sys.media.ohos_app_icon')


    // 资源的匹配：
    // 应用使用某资源时，系统会根据当前设备状态优先从相匹配的限定词目录中寻找该资源。
    // 只有当resources目录中没有与设备状态匹配的限定词目录，或者在限定词目录中找不到该资源时，才会去base目录中查找。
    // rawfile是原始文件目录，不会根据设备状态去匹配不同的资源。




    // overlay机制
    // overlay是一种资源替换机制，针对不同品牌、产品的显示风格，开发者可以在不重新打包业务逻辑hap的情况下，
    // 通过配置和使用overlay资源包，实现应用界面风格变换。overlay资源包只包含资源文件、资源索引文件和配置文件。
  }
}
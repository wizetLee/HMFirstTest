if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface Index_Params {
    listener?: (info: uiObserver.RouterPageInfo) => void;
    closer?: () => void;
    message?: string;
    scroller?: Scroller;
    listScroller?: Scroller;
    bgColors?: Color[];
    customOverBuilderParam?: (($$: number) => void);
    // build() {
    //   Scroll(this.scroller) {
    //     RelativeContainer() {
    //       Column({ space: 10 }) {
    //         Row({
    //           space: 10,
    //         }) {
    //           Image($r('app.media.startIcon'))
    //             .width(40)
    //             .height(40)
    //           Text("哈哈，你好啊").fontSize(20)
    //         }.justifyContent(FlexAlign.SpaceBetween).width("100%").padding({left: 10, right: 10})
    //
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.End)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.TopStart)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.TopEnd)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.BottomEnd)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.Center)
    //           .textAlign(TextAlign.Center)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.Center)
    //           .textAlign(TextAlign.End)
    //         Row() {
    //           Text("123").backgroundColor(0x555555)
    //           Blank()
    //           Text("123")
    //           Blank()
    //           Text("123")
    //         }.width('90%').height(50).backgroundColor(0xF5DEB3) //.justifyContent(FlexAlign.SpaceAround)
    //         Row().width('90%').height(50).backgroundColor(0xD2B48C)
    //         Row().width('90%').height(50).backgroundColor(0xF5DEB3)
    //       }.width('100%').alignItems(HorizontalAlign.Center).id("a_relative_container")
    //
    //       // Button('Ok', { type: ButtonType.Normal, stateEffect: true })
    //       //   .borderRadius(8)
    //       //   .backgroundColor(0x317aff)
    //       //   .width(1)
    //       //   .height(40)
    //       // Text(this.message)
    //       //   .backgroundColor(Color.Blue)
    //       //   .id('HelloWorld')
    //       //   .fontSize(10)
    //       //   .fontWeight(FontWeight.Bold)
    //       //   .alignRules({
    //       //     center: { anchor: '__container__', align: VerticalAlign.Center },
    //       //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
    //       //   })
    //     }
    //     .height('100%')
    //     .width('100%')
    //   }
    //   .width('100%')
    //   .height('100%')
    //   .onScrollStart(() => {
    //     console.log("开始滑动");
    //   })
    //   .onScrollStop(() => {
    //     console.log("停止滑动");
    //     //
    //   })
    //   .backgroundColor(0xDCDCDC)
    //   .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    //   .scrollBar(BarState.On) // 滚动条常驻显示
    //   .scrollBarColor(Color.Gray) // 滚动条颜色
    //   .scrollBarWidth(10) // 滚动条宽度
    //   .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
    // }
    // build() {
    //   GridRow({columns: { sm: 4, md: 8 }, direction: GridRowDirection.RowReverse, gutter: {x: 1, y: 2}}) {
    //     ForEach(this.bgColors, (item:Color, index?:number|undefined) => {
    //       GridCol({
    //         span: index == 0 ? 2 : 1, // 一个倍数，宽度乘以columns
    //         offset: index == 0 ? 1 : null, // 可以配置 隔离 多个columns位置
    //         order: index == 1 ? 1 : 2, // 可以自定义item本GridCol的位置的优先级
    //       }) {
    //         Row() {
    //           Text(`${index}`)
    //         }.width('100%').height('50')
    //       }.backgroundColor(item)
    //     })
    //   }
    // }
    listElements?: Array<number>;
    alphabets?;
    selectedIndex?: number;
    services?: Array<string>;
    label?: string;
    count?: number;
    points?: PointVector;
    tabController?: TabsController;
    currentIndex?: number;
    swiperController?: SwiperController;
}
import uiObserver from "@ohos:arkui.observer";
// import { Body } from './body';
function overBuilder($$: number, parent = null) {
    const __$$__ = $$;
    (parent ? parent : this).observeComponentCreation2((elmtId, isInitialRender, $$ = __$$__) => {
        Text.create($$.toString());
        Text.debugLine("entry/src/main/ets/pages/Index.ets(15:3)", "entry");
        Text.width(400);
        Text.height(50);
        Text.backgroundColor(Color.Green);
    }, Text);
    Text.pop();
}
/// @Extend仅支持在全局定义，支持提供参数
function __Text__fancy(color: Color): void {
    Text.fontColor(color);
}
class Index extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.listener = (info: uiObserver.RouterPageInfo) => {
            let routerInfo: uiObserver.RouterPageInfo | undefined = this.queryRouterPageInfo();
            if (info.pageId == routerInfo?.pageId) {
                if (info.state == uiObserver.RouterPageState.ON_PAGE_SHOW) {
                    console.log(`Index onPageShow`);
                }
                else if (info.state == uiObserver.RouterPageState.ON_PAGE_HIDE) {
                    console.log(`Index onPageHide`);
                }
            }
        };
        this.closer = this.closerBuilder;
        this.__message = new ObservedPropertySimplePU('Hello World', this, "message");
        this.scroller = new Scroller();
        this.listScroller = new Scroller();
        this.__bgColors = new ObservedPropertyObjectPU([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            // Color.Pink, Color.Grey,
            Color.Blue, Color.Brown, Color.Red, Color.Orange, Color.Yellow, Color.Green]
        // = overBuilder 是一个赋值动作
        , this, "bgColors");
        this.customOverBuilderParam = overBuilder;
        this.listElements = [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4,];
        this.alphabets = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
            'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        this.__selectedIndex = new ObservedPropertySimplePU(0, this, "selectedIndex");
        this.__services = new ObservedPropertyObjectPU(['直播', '进口', '直播', '进口', '直播', '进口', '直播', '进口', '直播', '进口', '直播', '进口', '直播', '进口'], this, "services");
        this.__label = new ObservedPropertySimplePU("parent", this, "label");
        this.__count = new ObservedPropertySimplePU(1, this, "count");
        this.__points = new ObservedPropertyObjectPU(new PointVector([
            new Point(50, Math.random() * 200),
            new Point(100, Math.random() * 200),
            new Point(150, Math.random() * 200),
            new Point(200, Math.random() * 200),
            new Point(250, Math.random() * 200),
        ]), this, "points");
        this.tabController = new TabsController();
        this.__currentIndex = new ObservedPropertySimplePU(2, this, "currentIndex");
        this.swiperController = new SwiperController();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: Index_Params) {
        if (params.listener !== undefined) {
            this.listener = params.listener;
        }
        if (params.closer !== undefined) {
            this.closer = params.closer;
        }
        if (params.message !== undefined) {
            this.message = params.message;
        }
        if (params.scroller !== undefined) {
            this.scroller = params.scroller;
        }
        if (params.listScroller !== undefined) {
            this.listScroller = params.listScroller;
        }
        if (params.bgColors !== undefined) {
            this.bgColors = params.bgColors;
        }
        if (params.customOverBuilderParam !== undefined) {
            this.customOverBuilderParam = params.customOverBuilderParam;
        }
        if (params.listElements !== undefined) {
            this.listElements = params.listElements;
        }
        if (params.alphabets !== undefined) {
            this.alphabets = params.alphabets;
        }
        if (params.selectedIndex !== undefined) {
            this.selectedIndex = params.selectedIndex;
        }
        if (params.services !== undefined) {
            this.services = params.services;
        }
        if (params.label !== undefined) {
            this.label = params.label;
        }
        if (params.count !== undefined) {
            this.count = params.count;
        }
        if (params.points !== undefined) {
            this.points = params.points;
        }
        if (params.tabController !== undefined) {
            this.tabController = params.tabController;
        }
        if (params.currentIndex !== undefined) {
            this.currentIndex = params.currentIndex;
        }
        if (params.swiperController !== undefined) {
            this.swiperController = params.swiperController;
        }
    }
    updateStateVars(params: Index_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__message.purgeDependencyOnElmtId(rmElmtId);
        this.__bgColors.purgeDependencyOnElmtId(rmElmtId);
        this.__selectedIndex.purgeDependencyOnElmtId(rmElmtId);
        this.__services.purgeDependencyOnElmtId(rmElmtId);
        this.__label.purgeDependencyOnElmtId(rmElmtId);
        this.__count.purgeDependencyOnElmtId(rmElmtId);
        this.__points.purgeDependencyOnElmtId(rmElmtId);
        this.__currentIndex.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__message.aboutToBeDeleted();
        this.__bgColors.aboutToBeDeleted();
        this.__selectedIndex.aboutToBeDeleted();
        this.__services.aboutToBeDeleted();
        this.__label.aboutToBeDeleted();
        this.__count.aboutToBeDeleted();
        this.__points.aboutToBeDeleted();
        this.__currentIndex.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private listener: (info: uiObserver.RouterPageInfo) => void;
    //FIXME:
    // 生命周期 -------------------
    onPageShow(): void {
        console.info("onPageShow");
    }
    onPageHide(): void {
        console.info("onPageHide");
    }
    //FIXME: 侧滑返回呢？？？？？？
    onBackPress(): boolean | void {
        console.info("onBackPress");
    }
    // 生命周期 -------------------
    aboutToAppear(): void {
        let record: Record<string, string> = { "xxx": "123" };
        let url: string | null = record.url;
        if (url == null) {
            console.log("record.url = null");
        }
        else {
            console.log("record.url =" + url);
        }
        //FIXME: 这样也行， 应该就是这样操作了
        // router.pushUrl({ url: 'pages/page' });
        // 注册
        // let uiObserver: UIObserver = this.getUIContext().getUIObserver();
        // uiObserver.on('routerPageUpdate', this.listener);
    }
    onDidBuild(): void {
    }
    aboutToDisappear(): void {
        // let uiObserver: UIObserver = this.getUIContext().getUIObserver();
        // uiObserver.off('routerPageUpdate', this.listener);
    }
    closerBuilder(parent = null) {
    }
    // 使用父组件的尾随闭包{}(@Builder装饰的方法)初始化子组件@BuilderParam
    private __closer;
    private __message: ObservedPropertySimplePU<string>;
    get message() {
        return this.__message.get();
    }
    set message(newValue: string) {
        this.__message.set(newValue);
    }
    private scroller: Scroller;
    private listScroller: Scroller;
    private __bgColors: ObservedPropertyObjectPU<Color[]>;
    get bgColors() {
        return this.__bgColors.get();
    }
    set bgColors(newValue: Color[]) {
        this.__bgColors.set(newValue);
    }
    // = overBuilder 是一个赋值动作
    private __customOverBuilderParam;
    // build() {
    //   Scroll(this.scroller) {
    //     RelativeContainer() {
    //       Column({ space: 10 }) {
    //         Row({
    //           space: 10,
    //         }) {
    //           Image($r('app.media.startIcon'))
    //             .width(40)
    //             .height(40)
    //           Text("哈哈，你好啊").fontSize(20)
    //         }.justifyContent(FlexAlign.SpaceBetween).width("100%").padding({left: 10, right: 10})
    //
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.End)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.TopStart)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.TopEnd)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.BottomEnd)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.Center)
    //           .textAlign(TextAlign.Center)
    //         Text('space: 20')
    //           .fontSize(15)
    //           .fontColor(Color.Gray)
    //           .width('90%')
    //           .backgroundColor(0x123456)
    //           .height(50)
    //           .align(Alignment.Center)
    //           .textAlign(TextAlign.End)
    //         Row() {
    //           Text("123").backgroundColor(0x555555)
    //           Blank()
    //           Text("123")
    //           Blank()
    //           Text("123")
    //         }.width('90%').height(50).backgroundColor(0xF5DEB3) //.justifyContent(FlexAlign.SpaceAround)
    //         Row().width('90%').height(50).backgroundColor(0xD2B48C)
    //         Row().width('90%').height(50).backgroundColor(0xF5DEB3)
    //       }.width('100%').alignItems(HorizontalAlign.Center).id("a_relative_container")
    //
    //       // Button('Ok', { type: ButtonType.Normal, stateEffect: true })
    //       //   .borderRadius(8)
    //       //   .backgroundColor(0x317aff)
    //       //   .width(1)
    //       //   .height(40)
    //       // Text(this.message)
    //       //   .backgroundColor(Color.Blue)
    //       //   .id('HelloWorld')
    //       //   .fontSize(10)
    //       //   .fontWeight(FontWeight.Bold)
    //       //   .alignRules({
    //       //     center: { anchor: '__container__', align: VerticalAlign.Center },
    //       //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
    //       //   })
    //     }
    //     .height('100%')
    //     .width('100%')
    //   }
    //   .width('100%')
    //   .height('100%')
    //   .onScrollStart(() => {
    //     console.log("开始滑动");
    //   })
    //   .onScrollStop(() => {
    //     console.log("停止滑动");
    //     //
    //   })
    //   .backgroundColor(0xDCDCDC)
    //   .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    //   .scrollBar(BarState.On) // 滚动条常驻显示
    //   .scrollBarColor(Color.Gray) // 滚动条颜色
    //   .scrollBarWidth(10) // 滚动条宽度
    //   .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
    // }
    // build() {
    //   GridRow({columns: { sm: 4, md: 8 }, direction: GridRowDirection.RowReverse, gutter: {x: 1, y: 2}}) {
    //     ForEach(this.bgColors, (item:Color, index?:number|undefined) => {
    //       GridCol({
    //         span: index == 0 ? 2 : 1, // 一个倍数，宽度乘以columns
    //         offset: index == 0 ? 1 : null, // 可以配置 隔离 多个columns位置
    //         order: index == 1 ? 1 : 2, // 可以自定义item本GridCol的位置的优先级
    //       }) {
    //         Row() {
    //           Text(`${index}`)
    //         }.width('100%').height('50')
    //       }.backgroundColor(item)
    //     })
    //   }
    // }
    private listElements: Array<number>;
    private alphabets;
    private __selectedIndex: ObservedPropertySimplePU<number>;
    get selectedIndex() {
        return this.__selectedIndex.get();
    }
    set selectedIndex(newValue: number) {
        this.__selectedIndex.set(newValue);
    }
    itemHead(text: string, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 列表分组的头部组件，对应联系人分组A、B等位置的组件
            Text.create(text);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(236:5)", "entry");
            // 列表分组的头部组件，对应联系人分组A、B等位置的组件
            Text.fontSize(20);
            // 列表分组的头部组件，对应联系人分组A、B等位置的组件
            Text.backgroundColor('#fff1f3f5');
            // 列表分组的头部组件，对应联系人分组A、B等位置的组件
            Text.width('100%');
            // 列表分组的头部组件，对应联系人分组A、B等位置的组件
            Text.padding(5);
        }, Text);
        // 列表分组的头部组件，对应联系人分组A、B等位置的组件
        Text.pop();
    }
    itemEnd(index: number, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 构建尾端滑出组件
            Button.createWithChild({ type: ButtonType.Circle });
            Button.debugLine("entry/src/main/ets/pages/Index.ets(246:5)", "entry");
            // 构建尾端滑出组件
            Button.onClick(() => {
                console.log("被点击了！");
            });
            ViewStackProcessor.visualState("focused");
            ViewStackProcessor.visualState("selected");
            ViewStackProcessor.visualState("pressed");
            ViewStackProcessor.visualState("normal");
            ViewStackProcessor.visualState();
        }, Button);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777220, "type": 20000, params: [], "bundleName": "com.example.firsttest", "moduleName": "entry" });
            Image.debugLine("entry/src/main/ets/pages/Index.ets(247:7)", "entry");
            Image.width(20);
            Image.height(20);
        }, Image);
        // 构建尾端滑出组件
        Button.pop();
    }
    private __services: ObservedPropertyObjectPU<Array<string>>;
    get services() {
        return this.__services.get();
    }
    set services(newValue: Array<string>) {
        this.__services.set(newValue);
    }
    private __label: ObservedPropertySimplePU<string>;
    get label() {
        return this.__label.get();
    }
    set label(newValue: string) {
        this.__label.set(newValue);
    }
    componentBuilder(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(`${this.label}`);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(269:5)", "entry");
        }, Text);
        Text.pop();
    }
    private __count: ObservedPropertySimplePU<number>;
    get count() {
        return this.__count.get();
    }
    set count(newValue: number) {
        this.__count.set(newValue);
    }
    private __points: ObservedPropertyObjectPU<PointVector>;
    get points() {
        return this.__points.get();
    }
    set points(newValue: PointVector) {
        this.__points.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(283:5)", "entry");
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // WZBody()
            /// 动画方式
            // Text(`${this.label}`).animation({duration: 2000, curve: Curve.Linear}).width(10)
            Polyline.create();
            Polyline.debugLine("entry/src/main/ets/pages/Index.ets(287:7)", "entry");
            Context.animation({ duration: 1000, curve: Curve.Ease });
            animatablePoints(ObservedObject.GetRawObject(this.points), elmtId, isInitialRender, this);
            Context.animation(null);
            // WZBody()
            /// 动画方式
            // Text(`${this.label}`).animation({duration: 2000, curve: Curve.Linear}).width(10)
            Polyline.size({ height: 220, width: 300 });
            // WZBody()
            /// 动画方式
            // Text(`${this.label}`).animation({duration: 2000, curve: Curve.Linear}).width(10)
            Polyline.fill(Color.Green);
            // WZBody()
            /// 动画方式
            // Text(`${this.label}`).animation({duration: 2000, curve: Curve.Linear}).width(10)
            Polyline.stroke(Color.Red);
            // WZBody()
            /// 动画方式
            // Text(`${this.label}`).animation({duration: 2000, curve: Curve.Linear}).width(10)
            Polyline.backgroundColor('#eeaacc');
        }, Polyline);
        Column.pop();
    }
    listWidget(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.debugLine("entry/src/main/ets/pages/Index.ets(320:5)", "entry");
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({
                space: 10,
                scroller: this.listScroller
            });
            List.debugLine("entry/src/main/ets/pages/Index.ets(321:7)", "entry");
            List.cachedCount(10);
            List.divider({ strokeWidth: 10 });
            List.width("100%");
            List.height("100%");
            List.scrollBar(BarState.On);
            List.sticky(StickyStyle.Header | StickyStyle.Footer);
            List.onScrollIndex((start, end, center) => {
                //FIXME:
            });
        }, List);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, index: number) => {
                const item = _item;
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    ListItemGroup.create({
                        header: this.itemHead.bind(this, `group${item} header`)
                    });
                    ListItemGroup.debugLine("entry/src/main/ets/pages/Index.ets(326:11)", "entry");
                }, ListItemGroup);
                {
                    const itemCreation = (elmtId, isInitialRender) => {
                        ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
                        itemCreation2(elmtId, isInitialRender);
                        if (!isInitialRender) {
                            ListItem.pop();
                        }
                        ViewStackProcessor.StopGetAccessRecording();
                    };
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        ListItem.create(deepRenderFunction, true, {});
                        ListItem.height(44);
                        ListItem.swipeAction({
                            end: {
                                // index为该ListItem在List中的索引值。
                                builder: () => {
                                    this.itemEnd(index);
                                }
                            },
                            start: {
                                // index为该ListItem在List中的索引值。
                                builder: () => {
                                    this.itemEnd(index);
                                }
                            }
                        });
                        ListItem.debugLine("entry/src/main/ets/pages/Index.ets(329:13)", "entry");
                    };
                    const deepRenderFunction = (elmtId, isInitialRender) => {
                        itemCreation(elmtId, isInitialRender);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create();
                            Row.debugLine("entry/src/main/ets/pages/Index.ets(330:15)", "entry");
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Badge.create({
                                count: 1,
                                position: BadgePosition.RightTop,
                                style: { badgeSize: 16, badgeColor: '#FA2A2D' }
                            });
                            Badge.debugLine("entry/src/main/ets/pages/Index.ets(331:17)", "entry");
                            Badge.width(30);
                            Badge.height(30);
                        }, Badge);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create({ "id": 16777217, "type": 20000, params: [], "bundleName": "com.example.firsttest", "moduleName": "entry" });
                            Image.debugLine("entry/src/main/ets/pages/Index.ets(336:19)", "entry");
                        }, Image);
                        Badge.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(`${item}`);
                            Text.debugLine("entry/src/main/ets/pages/Index.ets(339:17)", "entry");
                        }, Text);
                        Text.pop();
                        Row.pop();
                        ListItem.pop();
                    };
                    this.observeComponentCreation2(itemCreation2, ListItem);
                    ListItem.pop();
                }
                ListItemGroup.pop();
            };
            this.forEachUpdateFunction(elmtId, this.listElements, forEachItemGenFunction, undefined, true, false);
        }, ForEach);
        ForEach.pop();
        List.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            // 字母表索引组件
            AlphabetIndexer.create({ arrayValue: this.alphabets, selected: 0 });
            AlphabetIndexer.debugLine("entry/src/main/ets/pages/Index.ets(371:7)", "entry");
            // 字母表索引组件
            AlphabetIndexer.selected(this.selectedIndex);
        }, AlphabetIndexer);
        Stack.pop();
    }
    // Grid的子组件必须是GridItem组件。
    gridWidget(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Grid.create();
            Grid.debugLine("entry/src/main/ets/pages/Index.ets(380:5)", "entry");
            Grid.rowsTemplate('1fr 1fr');
            Grid.rowsGap(10);
            Grid.columnsGap(10);
        }, Grid);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, index) => {
                const service = _item;
                {
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        GridItem.create(() => { }, false);
                        GridItem.width('25%');
                        GridItem.debugLine("entry/src/main/ets/pages/Index.ets(382:9)", "entry");
                    };
                    const observedDeepRender = () => {
                        this.observeComponentCreation2(itemCreation2, GridItem);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(service);
                            Text.debugLine("entry/src/main/ets/pages/Index.ets(383:11)", "entry");
                        }, Text);
                        Text.pop();
                        GridItem.pop();
                    };
                    observedDeepRender();
                }
            };
            this.forEachUpdateFunction(elmtId, this.services, forEachItemGenFunction, undefined, true, false);
        }, ForEach);
        ForEach.pop();
        Grid.pop();
    }
    // 轮播
    swiperWidget(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Swiper.create(this.swiperController);
            Swiper.debugLine("entry/src/main/ets/pages/Index.ets(411:5)", "entry");
            Swiper.displayCount(2);
            Swiper.loop(true);
            Swiper.autoPlay(true);
            Swiper.interval(3001);
            Swiper.height("50%");
            Swiper.indicator(Indicator.dot() // .left(0)
                .bottom(-10)
                .itemWidth(15)
                .itemHeight(15)
                .selectedItemWidth(30)
                .selectedItemHeight(15)
                .color(Color.Red)
                .selectedColor(Color.Blue));
        }, Swiper);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('0');
            Text.debugLine("entry/src/main/ets/pages/Index.ets(412:7)", "entry");
            Text.width('90%');
            Text.height('100%');
            Text.backgroundColor(Color.Gray);
            Text.textAlign(TextAlign.Center);
            Text.fontSize(30);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('1');
            Text.debugLine("entry/src/main/ets/pages/Index.ets(419:7)", "entry");
            Text.width('90%');
            Text.height('100%');
            Text.backgroundColor(Color.Green);
            Text.textAlign(TextAlign.Center);
            Text.fontSize(30);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('2');
            Text.debugLine("entry/src/main/ets/pages/Index.ets(426:7)", "entry");
            Text.width('90%');
            Text.height('100%');
            Text.backgroundColor(Color.Pink);
            Text.textAlign(TextAlign.Center);
            Text.fontSize(30);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('3');
            Text.debugLine("entry/src/main/ets/pages/Index.ets(433:7)", "entry");
            Text.width('90%');
            Text.height('100%');
            Text.backgroundColor(Color.Yellow);
            Text.textAlign(TextAlign.Center);
            Text.fontSize(30);
        }, Text);
        Text.pop();
        Swiper.pop();
    }
    private tabController: TabsController;
    tabWidget(parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Tabs.create({ index: this.currentIndex, controller: this.tabController });
            Tabs.debugLine("entry/src/main/ets/pages/Index.ets(461:5)", "entry");
            Tabs.animationDuration(250);
            Tabs.barPosition(BarPosition.Start);
            Tabs.vertical(false);
            Tabs.scrollable(true);
            Tabs.barMode(BarMode.Fixed);
            Tabs.onChange((index) => {
                this.currentIndex = index;
                console.log(`切换到了${index}页`);
                // currentIndex 更改后 如何刷新UI？？？？
            });
            Tabs.height("80%");
        }, Tabs);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create("内容1");
                    Text.debugLine("entry/src/main/ets/pages/Index.ets(463:9)", "entry");
                }, Text);
                Text.pop();
            });
            TabContent.tabBar("111");
            TabContent.debugLine("entry/src/main/ets/pages/Index.ets(462:7)", "entry");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create("内容2");
                    Text.debugLine("entry/src/main/ets/pages/Index.ets(467:9)", "entry");
                }, Text);
                Text.pop();
            });
            TabContent.tabBar("222");
            TabContent.debugLine("entry/src/main/ets/pages/Index.ets(466:7)", "entry");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create("内容3");
                    Text.debugLine("entry/src/main/ets/pages/Index.ets(471:9)", "entry");
                }, Text);
                Text.pop();
            });
            TabContent.tabBar({ builder: () => {
                    this.tabBuilder.call(this, '我的', 0, { "id": 16777227, "type": 20000, params: [], "bundleName": "com.example.firsttest", "moduleName": "entry" }, { "id": 16777217, "type": 20000, params: [], "bundleName": "com.example.firsttest", "moduleName": "entry" });
                } });
            TabContent.debugLine("entry/src/main/ets/pages/Index.ets(470:7)", "entry");
        }, TabContent);
        TabContent.pop();
        Tabs.pop();
    }
    // 指定的位置
    private __currentIndex: ObservedPropertySimplePU<number>;
    get currentIndex() {
        return this.__currentIndex.get();
    }
    set currentIndex(newValue: number) {
        this.__currentIndex.set(newValue);
    }
    tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(492:5)", "entry");
            Column.width('100%');
            Column.height(50);
            Column.justifyContent(FlexAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.currentIndex === targetIndex ? selectedImg : normalImg);
            Image.debugLine("entry/src/main/ets/pages/Index.ets(493:7)", "entry");
            Image.size({ width: 25, height: 25 });
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.currentIndex === targetIndex ? "选中" : title);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(495:7)", "entry");
            Text.fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B');
        }, Text);
        Text.pop();
        Column.pop();
    }
    private swiperController: SwiperController;
    scroll2() {
        this.listScroller.scrollTo({ xOffset: 0, yOffset: 100 });
        this.listScroller.scrollToIndex(2);
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
class Point {
    x: number;
    y: number;
    constructor(x: number, y: number) {
        this.x = x;
        this.y = y;
    }
    plus(rhs: Point): Point {
        return new Point(this.x + rhs.x, this.y + rhs.y);
    }
    subtract(rhs: Point): Point {
        return new Point(this.x - rhs.x, this.y - rhs.y);
    }
    multiply(scale: number): Point {
        return new Point(this.x * scale, this.y * scale);
    }
    equals(rhs: Point): boolean {
        return this.x === rhs.x && this.y === rhs.y;
    }
}
class PointVector extends Array<Point> implements AnimatableArithmetic<PointVector> {
    constructor(value: Array<Point>) {
        super();
        value.forEach(p => this.push(p));
    }
    plus(rhs: PointVector): PointVector {
        let result = new PointVector([]);
        const len = Math.min(this.length, rhs.length);
        for (let i = 0; i < len; i++) {
            result.push((this as Array<Point>)[i].plus((rhs as Array<Point>)[i]));
        }
        return result;
    }
    subtract(rhs: PointVector): PointVector {
        let result = new PointVector([]);
        const len = Math.min(this.length, rhs.length);
        for (let i = 0; i < len; i++) {
            result.push((this as Array<Point>)[i].subtract((rhs as Array<Point>)[i]));
        }
        return result;
    }
    multiply(scale: number): PointVector {
        let result = new PointVector([]);
        for (let i = 0; i < this.length; i++) {
            result.push((this as Array<Point>)[i].multiply(scale));
        }
        return result;
    }
    equals(rhs: PointVector): boolean {
        if (this.length != rhs.length) {
            return false;
        }
        for (let i = 0; i < this.length; i++) {
            if (!(this as Array<Point>)[i].equals((rhs as Array<Point>)[i])) {
                return false;
            }
        }
        return true;
    }
    get(): Array<Object[]> {
        let result: Array<Object[]> = [];
        this.forEach(p => result.push([p.x, p.y]));
        return result;
    }
}
function animatablePoints(points: PointVector, elmtId, isInitialRender, parent): void {
    if (isInitialRender) {
        Polyline.createAnimatableProperty("animatablePoints", points, (points: PointVector) => {
            ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
            ViewStackProcessor.GetAndPushFrameNode("Polyline", elmtId);
            Polyline.points(points.get());
            ViewStackProcessor.StopGetAccessRecording();
            parent.finishUpdateFunc(elmtId);
        });
        Polyline.points(points.get());
    }
    else {
        Polyline.updateAnimatableProperty("animatablePoints", points);
    }
}
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "com.example.firsttest", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false" });
